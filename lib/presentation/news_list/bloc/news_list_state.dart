part of 'news_list_bloc.dart';

abstract class NewsListState {}

class NewsListInitState extends NewsListState {}

class NewsListLoadedState extends NewsListState {
  final List<NewsModel> listNews;

  NewsListLoadedState({
    required this.listNews,
  });
}

class NewsListLoadingState extends NewsListState {}

class NewsListFailureState extends NewsListState {
  String message;

  NewsListFailureState({required this.message});
}
