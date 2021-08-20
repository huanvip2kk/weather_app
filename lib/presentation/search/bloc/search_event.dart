part of 'search_bloc.dart';

abstract class SearchEvent{}
class SearchLoadEvent extends SearchEvent{}
class SearchPressedEvent extends SearchEvent{
  final String cityName;
  SearchPressedEvent({required this.cityName,});
}
