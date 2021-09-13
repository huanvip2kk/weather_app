// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) {
  return UsersModel(
    name: json['name'] as String,
    uid: json['uid'] as String,
    email: json['email'] as String,
    isAdmin: json['isAdmin'] as bool,
    isActive: json['isActive'] as bool,
  );
}

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'uid': instance.uid,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'isActive': instance.isActive,
    };
