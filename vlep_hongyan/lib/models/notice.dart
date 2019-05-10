import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart';


@JsonSerializable()
@immutable
class NoticeEntity {
  final String message;
  final int times;

  NoticeEntity({
    this.message = '',
    this.times = 2
  });

  factory NoticeEntity.fromJson(Map<String, dynamic> json) => _$NoticeEntityFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeEntityToJson(this);

}