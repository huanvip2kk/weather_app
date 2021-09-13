part of 'account_update_bloc.dart';

abstract class AccountUpdateEvent{}
class AccountUpdateLoadEvent extends AccountUpdateEvent{

}

class AccountUpdatePressedEvent extends AccountUpdateEvent {
  final bool isAdmin;
  final String email;
  final String uid;
  final bool isActive;
  final String name;

  AccountUpdatePressedEvent({
    required this.isAdmin,
    required this.email,
    required this.isActive,
    required this.name,
    required this.uid,
  });
}