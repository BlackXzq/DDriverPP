// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoticeEntity _$NoticeEntityFromJson(Map<String, dynamic> json) {
  return NoticeEntity(
      message: json['message'] as String, times: json['times'] as int);
}

Map<String, dynamic> _$NoticeEntityToJson(NoticeEntity instance) =>
    <String, dynamic>{'message': instance.message, 'times': instance.times};
