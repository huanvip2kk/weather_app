part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadedState extends HomeState {
  final WeatherModel weatherModel;

  HomeLoadedState({required this.weatherModel});
}

class HomeLoadingState extends HomeState {}

class HomeFailureState extends HomeState {
  String message;

  HomeFailureState({required this.message});
}
