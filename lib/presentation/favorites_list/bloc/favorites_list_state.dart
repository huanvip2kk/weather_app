part of 'favorites_list_bloc.dart';

abstract class FavoritesListState{}

class FavoritesListInitState extends FavoritesListState{}
class FavoritesListLoadedState extends FavoritesListState{
  final List<FavoritesModel> favoritesModel;
  final List<LocationModel>? locationModel;
  FavoritesListLoadedState({required this.favoritesModel, this.locationModel});
}
class FavoritesListLoadingState extends FavoritesListState{}
class FavoritesListFailureState extends FavoritesListState{
  String message;
  FavoritesListFailureState({required this.message});
}