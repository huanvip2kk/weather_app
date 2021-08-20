// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return LocationModel(
    title: json['title'] as String?,
    location_type: json['location_type'] as String,
    woeid: json['woeid'] as int,
    latt_long: json['latt_long'] as String,
  );
}

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location_type': instance.location_type,
      'woeid': instance.woeid,
      'latt_long': instance.latt_long,
    };
