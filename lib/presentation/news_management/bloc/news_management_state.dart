part of 'news_management_bloc.dart';

abstract class NewsManagementState {}

class NewsManagementInitState extends NewsManagementState {}

class NewsManagementLoadedState extends NewsManagementState {
  final List<NewsModel> listNews;

  NewsManagementLoadedState({
    required this.listNews,
  });
}

class NewsManagementLoadingState extends NewsManagementState {}

class NewsManagementFailureState extends NewsManagementState {
  String message;

  NewsManagementFailureState({required this.message});
}
