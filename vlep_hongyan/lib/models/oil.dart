import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'oil.g.dart';

@JsonSerializable()
@immutable
class OilOrderEntity {
  String driverId; //司机id
  String scheduleNum; //调度单号
  String tknum; //装运单号
  String type; //0: 可以修改 1：不能修改
  String uploadTime; //上传时间
  String van; //VAN 码

  OilOrderEntity({
    this.driverId = '',
    this.scheduleNum = '',
    this.tknum = '',
    this.type = '',
    this.uploadTime = '',
    this.van = ''
  });

  factory OilOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$OilOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$OilOrderEntityToJson(this);

}
