part of 'account_bloc.dart';

abstract class AccountEvent {}

class AccountLoadEvent extends AccountEvent {}

class AccountChangeUserNameEvent extends AccountEvent {
  final String userName;

  AccountChangeUserNameEvent({
    required this.userName,
  });
}

class AccountChangeUserPhotoEvent extends AccountEvent {
  final XFile photoURL;

  AccountChangeUserPhotoEvent({
    required this.photoURL,
  });
}
