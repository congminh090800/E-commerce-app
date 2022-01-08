// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleDTO _$ScheduleDTOFromJson(Map<String, dynamic> json) => ScheduleDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['date'] == null ? null : DateTime.parse(json['date'] as String),
      json['endTime'] as String?,
      json['endTimestamp'] as int?,
      json['startTime'] as String?,
      json['startTimestamp'] as int?,
      json['tutorId'] as String?,
      (json['scheduleDetailInfo'] as List<dynamic>?)
          ?.map((e) => ScheduleDetailDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['isBooked'] as bool?,
      (json['scheduleDetails'] as List<dynamic>?)
          ?.map((e) => ScheduleDetailDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ScheduleDTOToJson(ScheduleDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'date': instance.date?.toIso8601String(),
      'endTime': instance.endTime,
      'endTimestamp': instance.endTimestamp,
      'startTime': instance.startTime,
      'startTimestamp': instance.startTimestamp,
      'tutorId': instance.tutorId,
      'scheduleDetailInfo':
          instance.scheduleDetailInfo?.map((e) => e.toJson()).toList(),
      'scheduleDetails':
          instance.scheduleDetails?.map((e) => e.toJson()).toList(),
      'isBooked': instance.isBooked,
    };
