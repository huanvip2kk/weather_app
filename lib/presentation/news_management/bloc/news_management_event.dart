part of 'news_management_bloc.dart';

abstract class NewsManagementEvent {}

class NewsManagementLoadEvent extends NewsManagementEvent {}

class NewsManagementLoadedEvent extends NewsManagementEvent{
  final List<NewsModel> listNews;
  NewsManagementLoadedEvent({required this.listNews});
}



class NewsManagementDeletePressedEvent extends NewsManagementEvent {
  final String docID;

  NewsManagementDeletePressedEvent({
    required this.docID,
  });
}