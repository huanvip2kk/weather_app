part of 'favorites_list_bloc.dart';

abstract class FavoritesListEvent {}

class FavoritesListLoadEvent extends FavoritesListEvent {}

class FavoritesListPressedEvent extends FavoritesListEvent {
  final String cityName;

  FavoritesListPressedEvent({required this.cityName});
}

class FavoritesListLoadedEvent extends FavoritesListEvent {
  final List<FavoritesModel> favoritesModel;

  FavoritesListLoadedEvent({
    required this.favoritesModel,
  });
}

class FavoritesListDeleteEvent extends FavoritesListEvent {
  final String docID;

  FavoritesListDeleteEvent({
    required this.docID,
  });
}
