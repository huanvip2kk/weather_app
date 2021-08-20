import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../generated/l10n.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
      : super(
          SignupInitialState(),
        );

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupPressedEvent) {
      yield SignupLoadingState();
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        await userCredential.user!.updateDisplayName(event.name);
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
        yield SignupSuccessState();
        yield SignupFloatingSuccessState();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          yield SignupFloatingFailureState(
            message: S.current.emailAlreadyInUse,
          );
        } else if (e.code == 'network-request-failed') {
          yield SignupFloatingFailureState(
            message: S.current.networkError,
          );
        }
        yield SignupFailureState();
      }
    }
  }
}
