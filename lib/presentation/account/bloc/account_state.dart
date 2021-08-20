part of 'account_bloc.dart';

abstract class AccountState{}

class AccountInitState extends AccountState{}
class AccountLoadedState extends AccountState{}
class AccountLoadingState extends AccountState{}
class AccountFailureState extends AccountState{
  String message;
  AccountFailureState({required this.message});
}