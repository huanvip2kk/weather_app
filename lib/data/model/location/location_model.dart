// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  LocationModel({
    required this.title,
    required this.locationType,
    required this.woeid,
    required this.lattLong,
  });

  final String title;

  @JsonKey(name: 'location_type')
  final String locationType;

  final int woeid;

  @JsonKey(name: 'latt_long')
  final String lattLong;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
