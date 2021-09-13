part of 'index_bloc.dart';

abstract class IndexState{}

class IndexInitState extends IndexState{}
class IndexLoginSuccessState extends IndexState{}
class IndexLoadingState extends IndexState{}
class IndexFailureState extends IndexState{
  String? message;
  IndexFailureState({this.message});
}

