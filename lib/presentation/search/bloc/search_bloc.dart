import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/favorites/favorites_model.dart';
import '../../../data/model/location/location_model.dart';
import '../../../data/reposistory/api_repo_impl.dart';
import '../../../data/utils/cloud_firestore_services/favorites_database_service.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.apiRepoImpl,
  }) : super(
          SearchInitState(),
        );

  ApiRepoImpl apiRepoImpl;

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    if (event is SearchPressedEvent) {
      yield* _mapSearchPressedEventToState(
        searchPressedEvent: event,
      );
    } else if (event is SearchPressedLoadedEvent) {
      yield* _mapPressedSearchLoadedEvent(
        searchPressedLoadedEvent: event,
      );
    } else if (event is SearchAddEvent) {
      yield* _mapSearchAddEventToState(
        searchAddEvent: event,
      );
    }
  }

  Stream<SearchState> _mapSearchPressedEventToState(
      {required SearchPressedEvent searchPressedEvent}) async* {
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        favorite.getFav(uid: FirebaseAuth.instance.currentUser!.uid).listen(
              (fav) => add(
                SearchPressedLoadedEvent(
                  list: fav,
                  cityName: searchPressedEvent.cityName,
                ),
              ),
            );
      } else {
        final response = await apiRepoImpl.getLocation(
          location: searchPressedEvent.cityName.toString(),
        );

        yield SearchResultState(
          locationModel: response,
        );
      }
    } catch (e) {
      yield SearchFailureState(
        message: e.toString(),
      );
    }
  }

  Stream<SearchState> _mapPressedSearchLoadedEvent(
      {required SearchPressedLoadedEvent searchPressedLoadedEvent}) async* {
    final response = await apiRepoImpl.getLocation(
      location: searchPressedLoadedEvent.cityName.toString(),
    );
    yield SearchResultState(
      locationModel: response,
      favoritesModel: searchPressedLoadedEvent.list,
    );
  }

  Stream<SearchState> _mapSearchAddEventToState(
      {required SearchAddEvent searchAddEvent}) async* {
    try {
      await favorite.favoriteAdd(
        locationName: searchAddEvent.locationName,
        favorites: searchAddEvent.favorite,
        woeid: searchAddEvent.woeid,
        docID: searchAddEvent.docID,
        uid: FirebaseAuth.instance.currentUser!.uid,
      );
    } catch (e) {
      yield SearchFailureState(
        message: e.toString(),
      );
    }
  }
}
