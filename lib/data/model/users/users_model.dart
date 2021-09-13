import 'package:json_annotation/json_annotation.dart';

part 'users_model.g.dart';

@JsonSerializable()
class UsersModel {
  final String name;
  final String uid;
  final String email;
  final bool isAdmin;
  final bool isActive;

  UsersModel({
    required this.name,
    required this.uid,
    required this.email,
    required this.isAdmin,
    required this.isActive,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);

  Map<String, dynamic> toJson() => _$UsersModelToJson(this);
}
