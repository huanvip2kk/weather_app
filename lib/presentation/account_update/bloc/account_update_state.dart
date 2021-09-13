
part of 'account_update_bloc.dart';

abstract class AccountUpdateState{}

class AccountUpdateInitState extends AccountUpdateState{}
class AccountUpdateLoadedState extends AccountUpdateState{}
class AccountUpdateLoadingState extends AccountUpdateState{}
class AccountUpdateFailureState extends AccountUpdateState{
  String message;
  AccountUpdateFailureState({required this.message});
}