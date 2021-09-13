part of 'signup_bloc.dart';

abstract class SignupEvent {
  SignupEvent();
}

class SignupPressedEvent extends SignupEvent {
  final String email;
  final String password;
  //final String phoneNumber;
  final String name;

  SignupPressedEvent({
    required this.email,
    required this.password,
   // required this.phoneNumber,
    required this.name,
  });
}
