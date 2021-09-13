import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/users/users_model.dart';

class UsersDBServices {
  final CollectionReference users =
  FirebaseFirestore.instance.collection("users");

  Future saveUser({required UsersModel usersModel,}) async {
    try {
      await users.doc(usersModel.email).set(
        usersModel.toJson(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future getUser({required String email,}) async {
    try {
      final data = await users.doc(email).get();
      final user = UsersModel.fromJson(data.data() as Map<String, dynamic>);
      return user;
    } catch (e) {
      return false;
    }
  }

  Future updateUser({
    required UsersModel usersModel,
    required String email,
  }) async {
    try {
      await users.doc(email).set(
        usersModel.toJson(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future deleteUser({required String email,}) async {
    try {
      await users.doc(email).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<UsersModel>> getListUsers() {
    return users.snapshots().map((user) {
      return user.docs
          .map(
            (e) =>
            UsersModel.fromJson(
              e.data() as Map<String, dynamic>,
            ),
      )
          .toList();
    });
  }
}

final users = UsersDBServices();
