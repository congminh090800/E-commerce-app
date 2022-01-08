// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDetailDTO _$ScheduleDetailDTOFromJson(Map<String, dynamic> json) =>
    ScheduleDetailDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['endPeriod'] as String?,
      json['endPeriodTimestamp'] as int?,
      json['scheduleId'] as String?,
      json['startPeriod'] as String?,
      json['startPeriodTimestamp'] as int?,
      (json['bookingInfo'] as List<dynamic>?)
          ?.map((e) => BookingDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isBooked'] as bool?,
    );

Map<String, dynamic> _$ScheduleDetailDTOToJson(ScheduleDetailDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'endPeriod': instance.endPeriod,
      'endPeriodTimestamp': instance.endPeriodTimestamp,
      'scheduleId': instance.scheduleId,
      'startPeriod': instance.startPeriod,
      'startPeriodTimestamp': instance.startPeriodTimestamp,
      'bookingInfo': instance.bookingInfo?.map((e) => e.toJson()).toList(),
      'isBooked': instance.isBooked,
    };
