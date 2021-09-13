part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeLoadEvent extends HomeEvent {
  final String? lang;

  HomeLoadEvent({
    this.lang,
  });
}

class HomeChangeEvent extends HomeEvent {
  final String? lang;

  HomeChangeEvent({
    this.lang,
  });
}
