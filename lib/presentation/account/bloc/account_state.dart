part of 'account_bloc.dart';

abstract class AccountState {}

class AccountInitState extends AccountState {}

class AccountLoadedState extends AccountState {
  final UsersModel usersModel;

  AccountLoadedState({
    required this.usersModel,
  });
}

class AccountLoadingState extends AccountState {}

class AccountFailureState extends AccountState {
  AccountFailureState({required this.message});

  String message;
}
