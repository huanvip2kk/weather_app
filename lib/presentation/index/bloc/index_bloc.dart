import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/utils/firebase_auth_service/login_signup_service.dart';

part 'index_event.dart';

part 'index_state.dart';

class IndexBloc extends Bloc<IndexEvent, IndexState> {
  IndexBloc() : super(IndexInitState());

  @override
  Stream<IndexState> mapEventToState(IndexEvent event) async* {
    if (event is IndexLoadEvent) {
      yield* _mapIndexLoadEvent();
    } else if (event is IndexGoogleLoginPressedEvent) {
      yield* _mapIndexGoogleLoginPressedEventToState(
        indexGoogleLoginPressedEvent: event,
      );
    } else if (event is IndexFacebookLoginPressedEvent) {
      yield* _mapIndexFacebookLoginPressedEventToState(
        indexFacebookLoginPressedEvent: event,
      );
    }
  }

  Stream<IndexState> _mapIndexLoadEvent() async* {
    try {
      yield IndexLoadingState();
      yield IndexLoginSuccessState();
    } on Exception catch (e) {
      yield IndexFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<IndexState> _mapIndexGoogleLoginPressedEventToState(
      {required IndexGoogleLoginPressedEvent
          indexGoogleLoginPressedEvent}) async* {
    try {
      yield IndexLoadingState();
      await loginSignupService.googleLogin();
      yield IndexLoginSuccessState();
    } catch (e) {
      yield IndexFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<IndexState> _mapIndexFacebookLoginPressedEventToState(
      {required IndexFacebookLoginPressedEvent
          indexFacebookLoginPressedEvent}) async* {
    try {
      yield IndexLoadingState();
      await loginSignupService.facebookLogin();
      yield IndexLoginSuccessState();
    } catch (e) {
      yield IndexFailureState(
        message: e.toString(),
      );
    }
  }
}
