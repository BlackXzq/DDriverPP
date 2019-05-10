// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
      userId: json['userId'] as int,
      token: json['token'] as String,
      username: json['username'] as String,
      type: json['type'] as int,
      customerType: json['customerType'] as int);
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'token': instance.token,
      'username': instance.username,
      'type': instance.type,
      'customerType': instance.customerType
    };
