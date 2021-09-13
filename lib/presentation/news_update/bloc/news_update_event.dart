part of 'news_update_bloc.dart';

abstract class NewsUpdateEvent {}

class NewsUpdateLoadEvent extends NewsUpdateEvent {}

class NewsUpdatePressedEvent extends NewsUpdateEvent {
  final String title;
  final String content;
  final List<File> images;
  final File? thumbnails;
  final String? thumbnailsLink;
  final String brief;
  final String uploadTime;
  final String docID;

  NewsUpdatePressedEvent({
    required this.content,
    required this.brief,
    required this.title,
    this.thumbnails,
    required this.images,
    required this.uploadTime,
    this.thumbnailsLink,
    required this.docID,
  });
}
