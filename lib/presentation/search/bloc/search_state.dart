part of 'search_bloc.dart';

abstract class SearchState{}

class SearchInitState extends SearchState{}
class SearchLoadedState extends SearchState{

}
class SearchResultState extends SearchState{
  final List<LocationModel> locationModel;

  SearchResultState({required this.locationModel});
}
class SearchLoadingState extends SearchState{}
class SearchFailureState extends SearchState{
  String message;
  SearchFailureState({required this.message});
}