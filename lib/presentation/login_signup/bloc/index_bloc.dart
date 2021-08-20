import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../generated/l10n.dart';

part 'index_event.dart';

part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitState());

  @override
  Stream<IndexState> mapEventToState(IndexEvent event) async* {
    switch (event.runtimeType) {
      case IndexLoadEvent:
        try {
          yield IndexLoadingState();
          yield IndexLoginSuccessState();
        } catch (e) {
          yield IndexFailureState(
            message: e.toString(),
          );
        }
        break;

      case GoogleLoginPressedEvent:
        try {
          yield IndexLoadingState();
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
          final GoogleSignInAuthentication googleAuth =
              await googleUser!.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          (await FirebaseAuth.instance.signInWithCredential(credential)).user;
          FirebaseAuth.instance.currentUser!.displayName.toString();
          yield IndexLoginSuccessState();
          yield FloatingSuccessState();
        } catch (e) {
          yield IndexFailureState(
            message: e.toString(),
          );
          yield FloatingFailureState(
            message: e.toString(),
          );
        }
        break;

      case FaceBookLoginPressedEvent:
        try {
          final LoginResult result = await FacebookAuth.instance.login();
          if (result.status == LoginStatus.success) {
            // Create a credential from the access token
            final OAuthCredential credential =
                FacebookAuthProvider.credential(result.accessToken!.token);
            // Once signed in, return the UserCredential
            await FirebaseAuth.instance.signInWithCredential(credential);
            await FirebaseAuth.instance.currentUser!.sendEmailVerification();
          }

          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            yield IndexLoginSuccessState();
            yield FloatingSuccessState();
          } else {
            yield IndexFailureState();
            yield FloatingFailureState(message: S.current.userNotVerify);
          }
        } catch (e) {
          yield IndexFailureState(
            message: e.toString(),
          );
          yield FloatingFailureState(
            message: e.toString(),
          );
        }
        break;
    }
  }
}
