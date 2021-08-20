part of 'index_bloc.dart';

abstract class IndexEvent{}
class IndexLoadEvent extends IndexEvent{}
class GoogleLoginPressedEvent extends IndexEvent {}
class FaceBookLoginPressedEvent extends IndexEvent{}