import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../generated/l10n.dart';
import '../../../data/model/users/users_model.dart';
import '../../../data/utils/cloud_firestore_services/users_database_services.dart';
import '../../../data/utils/firebase_auth_service/login_signup_service.dart';

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
    if (event is LoginLoadEvent) {
      yield* _mapLoginLoadEventToState();
    } else if (event is LoginPressedEvent) {
      yield* _mapLoginPressedEventToState(loginPressedEvent: event);
    }
  }

  Stream<LoginState> _mapLoginLoadEventToState() async* {
    try {
      yield LoginLoadingState();
    } catch (e) {
      yield LoginFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<LoginState> _mapLoginPressedEventToState(
      {required LoginPressedEvent loginPressedEvent}) async* {
    yield LoginLoadingState();
    try {
      await loginSignupService.login(
        email: loginPressedEvent.email!,
        password: loginPressedEvent.password!,
      );

      final UsersModel usersModel = await users.getUser(
        email: FirebaseAuth.instance.currentUser!.email!,
      );

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        if (usersModel.isActive == true) {
          yield LoginSuccessState();
        } else {
          yield LoginFailureState(message: S.current.userNotActive);
        }
      } else {
        yield LoginFailureState(
          message: S.current.userNotVerify,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        yield LoginFailureState(
          message: S.current.userNotFound,
        );
      } else if (e.code == 'wrong-password') {
        yield LoginFailureState(
          message: S.current.wrongPassword,
        );
      } else if (e.code == 'Network-request-failed') {
        yield LoginFailureState(
          message: S.current.networkError,
        );
      }
    }
  }
}
