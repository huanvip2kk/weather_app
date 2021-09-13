part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {}

class ForgotPasswordLoadEvent extends ForgotPasswordEvent {}

class ForgotPasswordPressedEvent extends ForgotPasswordEvent {
  final String emailText;

  ForgotPasswordPressedEvent({
    required this.emailText,
  });
}
