// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OilOrderEntity _$OilOrderEntityFromJson(Map<String, dynamic> json) {
  return OilOrderEntity(
      driverId: json['driverId'] as String,
      scheduleNum: json['scheduleNum'] as String,
      tknum: json['tknum'] as String,
      type: json['type'] as String,
      uploadTime: json['uploadTime'] as String,
      van: json['van'] as String);
}

Map<String, dynamic> _$OilOrderEntityToJson(OilOrderEntity instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
      'scheduleNum': instance.scheduleNum,
      'tknum': instance.tknum,
      'type': instance.type,
      'uploadTime': instance.uploadTime,
      'van': instance.van
    };
