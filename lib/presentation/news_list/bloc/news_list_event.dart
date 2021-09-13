part of 'news_list_bloc.dart';

abstract class NewsListEvent {}

class NewsListLoadEvent extends NewsListEvent {}

class NewsListLoadedEvent extends NewsListEvent {
  final List<NewsModel> listNews;

  NewsListLoadedEvent({required this.listNews});
}
