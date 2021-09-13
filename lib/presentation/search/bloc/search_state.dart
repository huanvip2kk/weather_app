part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitState extends SearchState {}

class SearchResultState extends SearchState {
  final List<LocationModel>? locationModel;
  final List<FavoritesModel>? favoritesModel;

  SearchResultState({
    this.locationModel,
    this.favoritesModel,
  });
}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {
  String message;

  SearchFailureState({required this.message});
}
