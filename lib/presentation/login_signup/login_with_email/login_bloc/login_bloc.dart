import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../../generated/l10n.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(
          LoginInitialState(),
        );

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginPressedEvent) {
      try {
        yield LoginLoadingState();

        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email!,
          password: event.password!,
        );
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          yield LoginSuccessState();
          yield FloatingSuccessState();
        } else {
          yield LoginFailureState();
          yield FloatingFailureState(message: S.current.userNotVerify);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          yield FloatingFailureState(
            message: S.current.userNotFound,
          );
        } else if (e.code == 'wrong-password') {
          yield FloatingFailureState(
            message: S.current.wrongPassword,
          );
        } else if (e.code == 'Network-request-failed') {
          yield FloatingFailureState(
            message: S.current.networkError,
          );
        }
        yield LoginFailureState();
      }
    }
  }
}
