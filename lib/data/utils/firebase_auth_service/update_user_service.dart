import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../model/users/users_model.dart';
import '../cloud_firestore_services/users_database_services.dart';

class UpdateUser {
  Future<void> updateUserAvatar({required String photoUrl}) async {
    final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    final user = FirebaseAuth.instance.currentUser!;

    final String storageRef = await firebaseStorage
        .ref('userAvatar/${user.uid}')
        .putFile(
          File(photoUrl),
        )
        .snapshot
        .ref
        .getDownloadURL();

    await FirebaseAuth.instance.currentUser!.updatePhotoURL(storageRef);
  }

  Future<void> updateUserDisplayName({required String userName}) async {
    await FirebaseAuth.instance.currentUser!.updateDisplayName(
      userName,
    );
  }

  Future<void> updateUser({
    required String email,
    required String name,
    required String uid,
    required bool isAdmin,
    required bool isActive,
  }) async {
    UsersModel usersModel = UsersModel(
      email: email,
      name: name,
      uid: uid,
      isAdmin: isAdmin,
      isActive: isActive,
    );

    await users.updateUser(
      usersModel: usersModel,
      email: email,
    );
  }
}

final updateUser = UpdateUser();
