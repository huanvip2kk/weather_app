import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/detail/detail_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../../data/utils/cloud_firestore_services/favorites_database_service.dart';

part 'detail_event.dart';

part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc({required this.apiRepoImpl}) : super(DetailInitState());

  ApiRepoImpl apiRepoImpl;

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is DetailLoadEvent) {
      yield* _mapDetailLoadEventToState(
        detailLoadEvent: event,
      );
    } else if (event is DetailFavoriteButtonPressedEvent) {
      yield* _mapDetailFavoriteButtonPressedEventToState(
        detailFavoriteButtonPressedEvent: event,
      );
    }
  }

  Stream<DetailState> _mapDetailLoadEventToState({
    required DetailLoadEvent detailLoadEvent,
  }) async* {
    yield DetailLoadingState();
    try {
      final response = await apiRepoImpl.getDetail(
        woeid: detailLoadEvent.woeid.toString(),
      );

      final DetailModel detailModel = response;

      yield DetailLoadedState(
        detailModel: detailModel,
      );
    } catch (error) {
      yield DetailFailureState(
        message: error.toString(),
      );
    }
  }

  Stream<DetailState> _mapDetailFavoriteButtonPressedEventToState({
    required DetailFavoriteButtonPressedEvent detailFavoriteButtonPressedEvent,
  }) async* {
    try {
      await favorite.favoriteUpdate(
        uid: FirebaseAuth.instance.currentUser!.uid,
        locationName: detailFavoriteButtonPressedEvent.locationName!,
        favorite: detailFavoriteButtonPressedEvent.favorite!,
        woeid: detailFavoriteButtonPressedEvent.woeid!,
        docID: detailFavoriteButtonPressedEvent.docID!,
      );
    } catch (e) {
      yield DetailFailureState(
        message: e.toString(),
      );
    }
  }
}
