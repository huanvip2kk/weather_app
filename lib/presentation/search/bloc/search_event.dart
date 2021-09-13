part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchLoadEvent extends SearchEvent {}

class SearchPressedLoadedEvent extends SearchEvent {
  final String? cityName;
  final List<FavoritesModel>? list;

  SearchPressedLoadedEvent({
    this.list,
    this.cityName,
  });
}

class SearchPressedEvent extends SearchEvent {
  final String? cityName;

  SearchPressedEvent({
    this.cityName,
  });
}

class SearchAddEvent extends SearchEvent {
  final bool favorite;
  final String locationName;
  final int woeid;
  final String docID;

  SearchAddEvent({
    required this.woeid,
    required this.favorite,
    required this.locationName,
    required this.docID,
  });
}
