import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schedules.g.dart';

@JsonSerializable()
@immutable
class Schedule {
  final List<ScheduleEntity> list;
  Schedule({
    this.list = const [],
  });

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@JsonSerializable()
@immutable
class ScheduleEntity {

  final int carTotalNumber;
  final String destCity;
  final String destProvince;
  final String scheduleNumber;
  final String scheduleOrders;
  final String srcCity;
  final String srcProvince;
  final int validateType;

  ScheduleEntity({
    this.carTotalNumber = 0,
    this.destCity = '',
    this.destProvince = '',
    this.scheduleNumber = '',
    this.scheduleOrders = '',
    this.srcCity = '',
    this.srcProvince = '',
    this.validateType = -1
  });

  factory ScheduleEntity.fromJson(Map<String, dynamic> json) =>
      _$ScheduleEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleEntityToJson(this);

}