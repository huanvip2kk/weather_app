part of 'news_add_bloc.dart';

abstract class NewsAddState{}

class NewsAddInitState extends NewsAddState{}
class NewsAddLoadedState extends NewsAddState{}
class NewsAddLoadingState extends NewsAddState{}
class NewsAddFailureState extends NewsAddState{
  String message;
  NewsAddFailureState({required this.message});
}
