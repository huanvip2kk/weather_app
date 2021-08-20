part of 'account_bloc.dart';

abstract class AccountEvent {}

class AccountLoadEvent extends AccountEvent {}

class AccountChangeEvent extends AccountEvent {
  final String userName;
  final String email;
  final XFile photoURL;

  AccountChangeEvent({
    required this.userName,
    required this.email,
    required this.photoURL
  });
}
