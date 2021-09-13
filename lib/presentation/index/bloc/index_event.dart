part of 'index_bloc.dart';

abstract class IndexEvent{}
class IndexLoadEvent extends IndexEvent{}
class IndexGoogleLoginPressedEvent extends IndexEvent {}
class IndexFacebookLoginPressedEvent extends IndexEvent{}