import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/utils/firebase_auth_service/update_user_service.dart';

part 'account_update_event.dart';
part 'account_update_state.dart';

class AccountUpdateBloc extends Bloc<AccountUpdateEvent, AccountUpdateState> {
  AccountUpdateBloc() : super(AccountUpdateInitState());

  @override
  Stream<AccountUpdateState> mapEventToState(AccountUpdateEvent event) async* {
    if (event is AccountUpdateLoadEvent) {
      yield* _mapAccountUpdateLoadEventToState();
    } else if (event is AccountUpdatePressedEvent) {
      yield* _mapAccountUpdatePressedEventToState(
        accountUpdatePressedEvent: event,
      );
    }
  }

  Stream<AccountUpdateState> _mapAccountUpdateLoadEventToState() async* {
    try {
      yield AccountUpdateLoadingState();
      yield AccountUpdateLoadedState();
    } catch (e) {
      yield AccountUpdateFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<AccountUpdateState> _mapAccountUpdatePressedEventToState(
      {required AccountUpdatePressedEvent accountUpdatePressedEvent}) async* {
    try {
      await updateUser.updateUser(
        email: accountUpdatePressedEvent.email,
        name: accountUpdatePressedEvent.name,
        uid: accountUpdatePressedEvent.uid,
        isAdmin: accountUpdatePressedEvent.isAdmin,
        isActive: accountUpdatePressedEvent.isActive,
      );
      yield AccountUpdateLoadedState();
    } catch (e) {
      yield AccountUpdateFailureState(
        message: e.toString(),
      );
    }
  }
}
