// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackDTO _$FeedbackDTOFromJson(Map<String, dynamic> json) => FeedbackDTO(
      json['id'] as String?,
      json['bookingId'] as String?,
      json['content'] as String?,
      json['rating'] as int?,
      json['firstId'] as String?,
      json['secondId'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['firstInfo'] == null
          ? null
          : TutorDTO.fromJson(json['firstInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackDTOToJson(FeedbackDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'content': instance.content,
      'rating': instance.rating,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'firstInfo': instance.firstInfo?.toJson(),
    };
