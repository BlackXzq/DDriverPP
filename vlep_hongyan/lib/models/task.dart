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
    this.isOnOffSign = -1
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

}