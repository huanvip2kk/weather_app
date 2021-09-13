part of 'news_add_bloc.dart';

abstract class NewsAddEvent{}
class NewsAddLoadEvent extends NewsAddEvent{}

class NewsAddPressedEvent extends NewsAddEvent {
  final String title;
  final String content;
  final List<File> images;
  final File thumbnails;
  final String brief;

  NewsAddPressedEvent({
    required this.title,
    required this.content,
    required this.images,
    required this.thumbnails,
    required this.brief,
  });
}