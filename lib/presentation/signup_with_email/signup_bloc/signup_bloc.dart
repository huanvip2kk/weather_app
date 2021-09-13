import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../../data/utils/firebase_auth_service/login_signup_service.dart';

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
      yield* _mapSignupPressedEventToState(signupPressedEvent: event);
    }
  }

  Stream<SignupState> _mapSignupPressedEventToState(
      {required SignupPressedEvent signupPressedEvent}) async* {
    yield SignupLoadingState();
    try {
      await loginSignupService.signup(
        email: signupPressedEvent.email,
        password: signupPressedEvent.password,
        name: signupPressedEvent.name,
      );

      yield SignupSuccessState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        yield SignupFailureState(
          message: S.current.emailAlreadyInUse,
        );
      } else if (e.code == 'network-request-failed') {
        yield SignupFailureState(
          message: S.current.networkError,
        );
      }
    }
  }
}
