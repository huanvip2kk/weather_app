import 'package:json_annotation/json_annotation.dart';

part 'favorites_model.g.dart';

@JsonSerializable()
class FavoritesModel {
  final String? locationName;
  final int? woeid;
  final String? uid;
  final bool? favorite;
  final String docID;

  FavoritesModel({
    this.locationName,
    this.favorite,
    this.uid,
    this.woeid,
    required this.docID,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) =>
      _$FavoritesModelFromJson(json);

  Map<String, dynamic> toJson() => _$FavoritesModelToJson(this);
}
