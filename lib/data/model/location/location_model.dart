// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  LocationModel({

    this.title,
    // ignore: non_constant_identifier_names
    required this.location_type,
    required this.woeid,
    // ignore: non_constant_identifier_names
    required this.latt_long,
  });

  final String? title;
  // ignore: non_constant_identifier_names
  final String location_type;
  final int woeid;
  // ignore: non_constant_identifier_names
  final String latt_long;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
