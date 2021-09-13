
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/model/favorites/favorites_model.dart';
import '../../../data/model/location/location_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../../data/utils/cloud_firestore_services/favorites_database_service.dart';

part 'favorites_list_event.dart';
part 'favorites_list_state.dart';

class FavoritesListBloc extends Bloc<FavoritesListEvent, FavoritesListState> {
  FavoritesListBloc({
    required this.apiRepoImpl,
  }) : super(
          FavoritesListInitState(),
        );

  ApiRepoImpl apiRepoImpl;

  StreamSubscription? _subscription;
  @override
  Stream<FavoritesListState> mapEventToState(FavoritesListEvent event) async* {
    if (event is FavoritesListLoadEvent) {
      yield* _mapFavoritesListLoadEventToState();
    } else if (event is FavoritesListLoadedEvent) {
      yield* _mapFavoritesListLoadedEventToState(event);
    } else if (event is FavoritesListDeleteEvent) {
      yield* _mapFavoritesListDeleteEventToState(event);
    }
  }

  Stream<FavoritesListState> _mapFavoritesListLoadEventToState() async* {
    await _subscription?.cancel();

    _subscription =  favorite.getFav(uid: FirebaseAuth.instance.currentUser!.uid).listen(
          (fav) => add(
            FavoritesListLoadedEvent(favoritesModel: fav),
          ),
        );

  }

  Stream<FavoritesListState> _mapFavoritesListLoadedEventToState(
      FavoritesListLoadedEvent event) async* {
    yield FavoritesListLoadedState(
      favoritesModel: event.favoritesModel,
    );
  }

  Stream<FavoritesListState> _mapFavoritesListDeleteEventToState(
      FavoritesListDeleteEvent event) async* {
    try {
      await favorite.deleteFav(
        event.docID,
      );
    } on Exception catch (e) {
      yield FavoritesListFailureState(
        message: e.toString(),
      );
    }
  }

}
