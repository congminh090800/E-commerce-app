// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetail _$ScheduleDetailFromJson(Map<String, dynamic> json) =>
    ScheduleDetail()
      ..id = json['id'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..startPeriodTimestamp = json['startPeriodTimestamp'] as int?
      ..endPeriodTimestamp = json['endPeriodTimestamp'] as int?
      ..startPeriod = json['startPeriod'] as String?
      ..endPeriod = json['endPeriod'] as String?
      ..scheduleId = json['scheduleId'] as String?
      ..scheduleInfo = json['scheduleInfo'] == null
          ? null
          : ScheduleInfo.fromJson(json['scheduleInfo'] as Map<String, dynamic>)
      ..isBooked = json['isBooked'] as bool?
      ..bookingInfo = (json['bookingInfo'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ScheduleDetailToJson(ScheduleDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'startPeriod': instance.startPeriod,
      'endPeriod': instance.endPeriod,
      'scheduleId': instance.scheduleId,
      'scheduleInfo': instance.scheduleInfo?.toJson(),
      'isBooked': instance.isBooked,
      'bookingInfo': instance.bookingInfo?.map((e) => e.toJson()).toList(),
    };
