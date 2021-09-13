import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc() : super(ForgotPasswordInitState());

  @override
  Stream<ForgotPasswordState> mapEventToState(
      ForgotPasswordEvent event) async* {
    if (event is ForgotPasswordLoadEvent) {
      yield* _mapForgotPasswordLoadEventToState();
    } else if (event is ForgotPasswordPressedEvent) {
      yield* _mapForgotPasswordPressedEventToState(
        forgotPasswordPressedEvent: event,
      );
    }
  }

  Stream<ForgotPasswordState> _mapForgotPasswordLoadEventToState() async* {
    try {
      yield ForgotPasswordLoadingState();

      yield ForgotPasswordLoadedState();
    } catch (e) {
      yield ForgotPasswordFailureState(message: e.toString());
    }
  }

  Stream<ForgotPasswordState> _mapForgotPasswordPressedEventToState(
      {required ForgotPasswordPressedEvent forgotPasswordPressedEvent}) async* {
    try {
      yield ForgotPasswordLoadingState();

      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: forgotPasswordPressedEvent.emailText,
      );

      yield ForgotPasswordLoadedState();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        yield ForgotPasswordFailureState(
          message: S.current.userNotFound,
        );
      } else if (e.code == 'Network-request-failed') {
        yield ForgotPasswordFailureState(
          message: S.current.networkError,
        );
      }
    }
  }
}
