part of 'detail_bloc.dart';

abstract class DetailEvent{}
class DetailLoadEvent extends DetailEvent{
  final String woeid;

  DetailLoadEvent({required this.woeid});
}
