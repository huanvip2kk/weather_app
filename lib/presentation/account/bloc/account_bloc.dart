
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/users/users_model.dart';
import '../../../data/utils/cloud_firestore_services/users_database_services.dart';
import '../../../data/utils/firebase_auth_service/update_user_service.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitState());

  UsersModel? _usersModel;

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    _usersModel =
        await users.getUser(email: FirebaseAuth.instance.currentUser!.email!);
    if (event is AccountLoadEvent) {
      yield* _mapLoadEventToState();
    } else if (event is AccountChangeUserNameEvent) {
      yield* _mapChangeUserNameEventToState(
        accountChangeUserNameEvent: event,
      );
    } else if (event is AccountChangeUserPhotoEvent) {
      yield* _mapChangeUserPhotoEventToState(
        accountChangeUserPhotoEvent: event,
      );
    }
  }

  Stream<AccountState> _mapLoadEventToState() async* {
    try {
      yield AccountLoadingState();

      yield AccountLoadedState(
        usersModel: _usersModel!,
      );
    } catch (e) {
      yield AccountFailureState(message: e.toString());
    }
  }

  Stream<AccountState> _mapChangeUserNameEventToState(
      {required AccountChangeUserNameEvent accountChangeUserNameEvent}) async* {
    try {
      yield AccountLoadingState();

      await updateUser.updateUserDisplayName(
        userName: accountChangeUserNameEvent.userName,
      );

      yield AccountLoadedState(usersModel: _usersModel!);
    } catch (e) {
      print(e);
      yield AccountFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<AccountState> _mapChangeUserPhotoEventToState(
      {required AccountChangeUserPhotoEvent
          accountChangeUserPhotoEvent}) async* {
    yield AccountLoadingState();
    try {
      await updateUser.updateUserAvatar(
        photoUrl: accountChangeUserPhotoEvent.photoURL.path,
      );
      yield AccountLoadedState(usersModel: _usersModel!);
    } on Exception catch (error) {
      yield AccountFailureState(
        message: error.toString(),
      );
    }
  }
}
