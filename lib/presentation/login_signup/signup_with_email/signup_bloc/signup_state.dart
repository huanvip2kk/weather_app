part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitialState extends SignupState {}

class SignupSuccessState extends SignupState {}

class SignupFailureState extends SignupState {
}

class SignupLoadingState extends SignupState {}

class SignupFloatingSuccessState extends SignupState {}

class SignupFloatingFailureState extends SignupState {
  final String message;

  SignupFloatingFailureState({required this.message});
}
