// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return Schedule(
      list: (json['list'] as List)
          ?.map((e) => e == null
              ? null
              : ScheduleEntity.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$ScheduleToJson(Schedule instance) =>
    <String, dynamic>{'list': instance.list};

ScheduleEntity _$ScheduleEntityFromJson(Map<String, dynamic> json) {
  return ScheduleEntity(
      carTotalNumber: json['carTotalNumber'] as int,
      destCity: json['destCity'] as String,
      destProvince: json['destProvince'] as String,
      scheduleNumber: json['scheduleNumber'] as String,
      scheduleOrders: json['scheduleOrders'] as String,
      srcCity: json['srcCity'] as String,
      srcProvince: json['srcProvince'] as String,
      validateType: json['validateType'] as int);
}

Map<String, dynamic> _$ScheduleEntityToJson(ScheduleEntity instance) =>
    <String, dynamic>{
      'carTotalNumber': instance.carTotalNumber,
      'destCity': instance.destCity,
      'destProvince': instance.destProvince,
      'scheduleNumber': instance.scheduleNumber,
      'scheduleOrders': instance.scheduleOrders,
      'srcCity': instance.srcCity,
      'srcProvince': instance.srcProvince,
      'validateType': instance.validateType
    };
