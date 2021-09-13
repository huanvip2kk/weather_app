part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({
    required this.message,
  });
}

class LoginLoadingState extends LoginState {}
