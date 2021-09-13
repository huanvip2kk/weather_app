part of 'account_list_bloc.dart';

abstract class AccountListEvent {}

class AccountListLoadEvent extends AccountListEvent {}

class AccountListLoadedEvent extends AccountListEvent {
  final List<UsersModel> list;

  AccountListLoadedEvent({required this.list});
}

class AccountListDeletePressedEvent extends AccountListEvent {
  final String email;

  AccountListDeletePressedEvent({required this.email});
}
