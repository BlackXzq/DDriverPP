// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_services.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return ApiResponse(
      repCode: json['repCode'] as int,
      repMsg: json['repMsg'] as String,
      repData: json['repData'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'repCode': instance.repCode,
      'repMsg': instance.repMsg,
      'repData': instance.repData
    };
