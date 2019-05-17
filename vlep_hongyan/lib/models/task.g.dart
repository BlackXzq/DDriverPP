// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tasks _$TasksFromJson(Map<String, dynamic> json) {
  return Tasks(
      list: (json['list'] as List)
          ?.map((e) =>
              e == null ? null : TaskEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$TasksToJson(Tasks instance) =>
    <String, dynamic>{'list': instance.list};

TaskEntity _$TaskEntityFromJson(Map<String, dynamic> json) {
  return TaskEntity(
      achieveTime: json['achieveTime'] as String,
      carTotalNum: json['carTotalNum'] as int,
      destCity: json['destCity'] as String,
      parentScheduleNumber: json['parentScheduleNumber'] as String,
      shipmentDate: json['shipmentDate'] as String,
      shippingType: json['shippingType'] as int,
      srcCity: json['srcCity'] as String,
      subScheduleNumber: json['subScheduleNumber'] as String,
      validateType: json['validateType'] as int,
      isOnOffSign: json['isOnOffSign'] as int);
}

Map<String, dynamic> _$TaskEntityToJson(TaskEntity instance) =>
    <String, dynamic>{
      'achieveTime': instance.achieveTime,
      'carTotalNum': instance.carTotalNum,
      'destCity': instance.destCity,
      'parentScheduleNumber': instance.parentScheduleNumber,
      'shipmentDate': instance.shipmentDate,
      'shippingType': instance.shippingType,
      'srcCity': instance.srcCity,
      'subScheduleNumber': instance.subScheduleNumber,
      'validateType': instance.validateType,
      'isOnOffSign': instance.isOnOffSign
    };
