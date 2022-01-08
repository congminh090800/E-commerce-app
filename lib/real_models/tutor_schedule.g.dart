// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorSchedule _$TutorScheduleFromJson(Map<String, dynamic> json) =>
    TutorSchedule()
      ..id = json['id'] as String?
      ..tutorId = json['tutorId'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..isBooked = json['isBooked'] as bool?
      ..startTimestamp = json['startTimestamp'] as int?
      ..endTimestamp = json['endTimestamp'] as int?
      ..startTime = json['startTime'] as String?
      ..endTime = json['endTime'] as String?
      ..scheduleDetails = (json['scheduleDetails'] as List<dynamic>?)
          ?.map((e) => ScheduleDetail.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TutorScheduleToJson(TutorSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutorId': instance.tutorId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isBooked': instance.isBooked,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'scheduleDetails':
          instance.scheduleDetails?.map((e) => e.toJson()).toList(),
    };
