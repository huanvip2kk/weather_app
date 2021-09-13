part of 'news_update_bloc.dart';

abstract class NewsUpdateState{}

class NewsUpdateInitState extends NewsUpdateState{}
class NewsUpdateLoadedState extends NewsUpdateState{}
class NewsUpdateLoadingState extends NewsUpdateState{}
class NewsUpdateFailureState extends NewsUpdateState{
  String message;
  NewsUpdateFailureState({required this.message});
}