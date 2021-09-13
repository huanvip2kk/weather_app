import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String title;
  final String content;
  final List<String> images;
  final String thumbnails;
  final String uploadTime;
  final String author;
  final String brief;
  final String docID;

  NewsModel({
    required this.title,
    required this.images,
    required this.content,
    required this.thumbnails,
    required this.uploadTime,
    required this.author,
    required this.brief,
    required this.docID,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
