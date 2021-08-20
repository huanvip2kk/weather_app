import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'account_event.dart';

part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountInitState());

  @override
  Stream<AccountState> mapEventToState(AccountEvent event) async* {
    if (event is AccountLoadEvent) {
      try {
        yield AccountLoadingState();
        yield AccountLoadedState();
      } catch (e) {
        yield AccountFailureState(message: e.toString());
      }
    } else if (event is AccountChangeEvent) {
      try {
        yield AccountLoadingState();

        //Update userImage
        final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

        final user = FirebaseAuth.instance.currentUser!.uid;
        final String storageRef = await firebaseStorage
            .ref('userAvatar/user$user/$user')
            .putFile(
              File(event.photoURL.path),
            )
            .snapshot
            .ref
            .getDownloadURL();

        await FirebaseAuth.instance.currentUser!.updatePhotoURL(storageRef);

        await FirebaseAuth.instance.currentUser!
            .updateDisplayName(event.userName);


        yield AccountLoadedState();
      } catch (e) {
        print(e);
        yield AccountFailureState(
          message: e.toString(),
        );
      }
    }
  }
}
