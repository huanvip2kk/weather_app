part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {
}

class LoginLoadingState extends LoginState {}

class FloatingSuccessState extends LoginState {}

class FloatingFailureState extends LoginState {
  final String message;

  FloatingFailureState({required this.message});
}
