import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
@immutable
class Tasks {
  final List<TaskEntity> list;
  Tasks({
    this.list = const [],
  });

  factory Tasks.fromJson(Map<String, dynamic> json) =>
      _$TasksFromJson(json);

  Map<String, dynamic> toJson() => _$TasksToJson(this);
}

@JsonSerializable()
@immutable
class TaskEntity {
  final String achieveTime;
  final int carTotalNum;
  final String destCity;
  final String parentScheduleNumber;
  final String shipmentDate;
  final int shippingType;
  final String srcCity;
  final String subScheduleNumber;
  final int validateType;
  final int isOnOffSign;
  final List<TaskEntityCar> carList;

  TaskEntity({
    this.achieveTime = '',
    this.carTotalNum = 0,
    this.destCity = '',
    this.parentScheduleNumber = '',
    this.shipmentDate = '',
    this.shippingType = -1,
    this.srcCity = '',
    this.subScheduleNumber = '',
    this.validateType = -1,
    this.isOnOffSign = -1,
    this.carList = const [],
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

}

@JsonSerializable()
@immutable
class TaskEntityCar {
  final String carColor;
  final String carModel;
  final String carryType;
  final String customerOrderNumber;
  final String destCity;
  final String destCounty;
  final String destDetailAddress;
  final String destProvince;
  final String engineCode;
  final int isDelivery;
  final String orderNumber;
  final String parentScheduleNumber;
  final String scheduleNumber;
  final String shipmentDate;
  final String shippingName;
  final int shippingType;
  final String srcCity;
  final String srcCounty;
  final String srcDetailAddress;
  final String srcProvince;
  final String supplierStatus;
  final String van;
  final String vhcleNum;
  final String vin;
  final String vsartCode;
  final String vsartDesc;

  TaskEntityCar({
    this.carColor = '',
    this.carModel = '',
    this.carryType = '',
    this.customerOrderNumber = '',
    this.destCity = '',
    this.destCounty = '',
    this.destDetailAddress = '',
    this.destProvince = '',
    this.engineCode = '',
    this.isDelivery = -1,
    this.orderNumber = '',
    this.parentScheduleNumber = '',
    this.scheduleNumber = '',
    this.shipmentDate = '',
    this.shippingName = '',
    this.shippingType = -1,
    this.srcCity = '',
    this.srcCounty = '',
    this.srcDetailAddress = '',
    this.srcProvince = '',
    this.supplierStatus = '',
    this.van = '',
    this.vhcleNum = '',
    this.vin = '',
    this.vsartCode = '',
    this.vsartDesc = ''
  });

  factory TaskEntityCar.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityCarFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityCarToJson(this);

}