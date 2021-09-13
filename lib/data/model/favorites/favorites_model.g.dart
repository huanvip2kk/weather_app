// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesModel _$FavoritesModelFromJson(Map<String, dynamic> json) {
  return FavoritesModel(
    locationName: json['locationName'] as String?,
    favorite: json['favorite'] as bool?,
    uid: json['uid'] as String?,
    woeid: json['woeid'] as int?,
    docID: json['docID'] as String,
  );
}

Map<String, dynamic> _$FavoritesModelToJson(FavoritesModel instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'woeid': instance.woeid,
      'uid': instance.uid,
      'favorite': instance.favorite,
      'docID': instance.docID,
    };
