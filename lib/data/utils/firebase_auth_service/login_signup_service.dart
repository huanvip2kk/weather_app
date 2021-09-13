import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../model/users/users_model.dart';
import '../cloud_firestore_services/users_database_services.dart';

class LoginSignupService {
  Future<void> signup(
      {required String email,
      required String password,
      required String name}) async {
    final UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await userCredential.user!.updateDisplayName(name);
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

    final UsersModel usersModel = UsersModel(
      name: name,
      uid: FirebaseAuth.instance.currentUser!.uid,
      email: email,
      isAdmin: false,
      isActive: true,
    );
    await users.saveUser(usersModel: usersModel);
  }

  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> googleLogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    FirebaseAuth.instance.currentUser!.displayName.toString();
  }

  Future<void> facebookLogin() async{
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
      FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }
}

final loginSignupService = LoginSignupService();
