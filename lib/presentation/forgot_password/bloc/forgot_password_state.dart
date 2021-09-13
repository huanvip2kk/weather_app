part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordState{}

class ForgotPasswordInitState extends ForgotPasswordState{}
class ForgotPasswordLoadedState extends ForgotPasswordState{}
class ForgotPasswordLoadingState extends ForgotPasswordState{}
class ForgotPasswordFailureState extends ForgotPasswordState{
  String message;
  ForgotPasswordFailureState({required this.message});
}