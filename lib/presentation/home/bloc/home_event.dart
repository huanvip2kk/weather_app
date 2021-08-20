part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeLoadEvent extends HomeEvent {
  final String units;
  final String? lang;

  HomeLoadEvent({
    required this.units,
    this.lang,
  });
}


