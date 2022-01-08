// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule()
  ..id = json['id'] as String?
  ..userId = json['userId'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..createdAtTimeStamp = json['createdAtTimeStamp'] as int?
  ..updatedAtTimeStamp = json['updatedAtTimeStamp'] as int?
  ..scheduleDetailId = json['scheduleDetailId'] as String?
  ..studentRequest = json['studentRequest'] as String?
  ..tutorReview = json['tutorReview'] as String?
  ..scoreByTutor = json['scoreByTutor'] as int?
  ..isDeleted = json['isDeleted'] as bool?
  ..scheduleDetailInfo = json['scheduleDetailInfo'] == null
      ? null
      : ScheduleDetail.fromJson(
          json['scheduleDetailInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'createdAtTimeStamp': instance.createdAtTimeStamp,
      'updatedAtTimeStamp': instance.updatedAtTimeStamp,
      'scheduleDetailId': instance.scheduleDetailId,
      'studentRequest': instance.studentRequest,
      'tutorReview': instance.tutorReview,
      'scoreByTutor': instance.scoreByTutor,
      'isDeleted': instance.isDeleted,
      'scheduleDetailInfo': instance.scheduleDetailInfo?.toJson(),
    };
