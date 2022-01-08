// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleInfo _$ScheduleInfoFromJson(Map<String, dynamic> json) => ScheduleInfo()
  ..id = json['id'] as String?
  ..tutorId = json['tutorId'] as String?
  ..startTime = json['startTime'] as String?
  ..endTime = json['endTime'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..date = json['date'] as String?
  ..startTimestamp = json['startTimestamp'] as int?
  ..endTimestamp = json['endTimestamp'] as int?
  ..tutorInfo = json['tutorInfo'] == null
      ? null
      : User.fromJson(json['tutorInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$ScheduleInfoToJson(ScheduleInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'date': instance.date,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'tutorInfo': instance.tutorInfo?.toJson(),
    };
