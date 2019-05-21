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
      isOnOffSign: json['isOnOffSign'] as int,
      carList: (json['carList'] as List)
          ?.map((e) => e == null
              ? null
              : TaskEntityCar.fromJson(e as Map<String, dynamic>))
          ?.toList());
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
      'isOnOffSign': instance.isOnOffSign,
      'carList': instance.carList
    };

TaskEntityCar _$TaskEntityCarFromJson(Map<String, dynamic> json) {
  return TaskEntityCar(
      carColor: json['carColor'] as String,
      carModel: json['carModel'] as String,
      carryType: json['carryType'] as String,
      customerOrderNumber: json['customerOrderNumber'] as String,
      destCity: json['destCity'] as String,
      destCounty: json['destCounty'] as String,
      destDetailAddress: json['destDetailAddress'] as String,
      destProvince: json['destProvince'] as String,
      engineCode: json['engineCode'] as String,
      isDelivery: json['isDelivery'] as int,
      orderNumber: json['orderNumber'] as String,
      parentScheduleNumber: json['parentScheduleNumber'] as String,
      scheduleNumber: json['scheduleNumber'] as String,
      shipmentDate: json['shipmentDate'] as String,
      shippingName: json['shippingName'] as String,
      shippingType: json['shippingType'] as int,
      srcCity: json['srcCity'] as String,
      srcCounty: json['srcCounty'] as String,
      srcDetailAddress: json['srcDetailAddress'] as String,
      srcProvince: json['srcProvince'] as String,
      supplierStatus: json['supplierStatus'] as String,
      van: json['van'] as String,
      vhcleNum: json['vhcleNum'] as String,
      vin: json['vin'] as String,
      vsartCode: json['vsartCode'] as String,
      vsartDesc: json['vsartDesc'] as String);
}

Map<String, dynamic> _$TaskEntityCarToJson(TaskEntityCar instance) =>
    <String, dynamic>{
      'carColor': instance.carColor,
      'carModel': instance.carModel,
      'carryType': instance.carryType,
      'customerOrderNumber': instance.customerOrderNumber,
      'destCity': instance.destCity,
      'destCounty': instance.destCounty,
      'destDetailAddress': instance.destDetailAddress,
      'destProvince': instance.destProvince,
      'engineCode': instance.engineCode,
      'isDelivery': instance.isDelivery,
      'orderNumber': instance.orderNumber,
      'parentScheduleNumber': instance.parentScheduleNumber,
      'scheduleNumber': instance.scheduleNumber,
      'shipmentDate': instance.shipmentDate,
      'shippingName': instance.shippingName,
      'shippingType': instance.shippingType,
      'srcCity': instance.srcCity,
      'srcCounty': instance.srcCounty,
      'srcDetailAddress': instance.srcDetailAddress,
      'srcProvince': instance.srcProvince,
      'supplierStatus': instance.supplierStatus,
      'van': instance.van,
      'vhcleNum': instance.vhcleNum,
      'vin': instance.vin,
      'vsartCode': instance.vsartCode,
      'vsartDesc': instance.vsartDesc
    };
