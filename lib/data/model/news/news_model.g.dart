// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) {
  return NewsModel(
    title: json['title'] as String,
    images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    content: json['content'] as String,
    thumbnails: json['thumbnails'] as String,
    uploadTime: json['uploadTime'] as String,
    author: json['author'] as String,
    brief: json['brief'] as String,
    docID: json['docID'] as String,
  );
}

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'images': instance.images,
      'thumbnails': instance.thumbnails,
      'uploadTime': instance.uploadTime,
      'author': instance.author,
      'brief': instance.brief,
      'docID': instance.docID,
    };
