// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingDTO _$BookingDTOFromJson(Map<String, dynamic> json) => BookingDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['createdAtTimeStamp'] as int?,
      json['updatedAtTimeStamp'] as int?,
      json['isDeleted'] as bool?,
      json['recordUrl'] as String?,
      json['scheduleDetailId'] as String?,
      json['scoreByTutor'] as int?,
      json['studentMeetingLin'] as String?,
      json['studentRequest'] as String?,
      json['tutorMeetingLink'] as String?,
      json['tutorReview'] as String?,
      json['userId'] as String?,
      json['scheduleDetailInfo'] == null
          ? null
          : ScheduleDetailDTO.fromJson(
              json['scheduleDetailInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingDTOToJson(BookingDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'isDeleted': instance.isDeleted,
      'recordUrl': instance.recordUrl,
      'scheduleDetailId': instance.scheduleDetailId,
      'scoreByTutor': instance.scoreByTutor,
      'studentMeetingLin': instance.studentMeetingLin,
      'studentRequest': instance.studentRequest,
      'tutorMeetingLink': instance.tutorMeetingLink,
      'tutorReview': instance.tutorReview,
      'userId': instance.userId,
      'scheduleDetailInfo': instance.scheduleDetailInfo?.toJson(),
    };
