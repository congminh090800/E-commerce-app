// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback()
  ..id = json['id'] as String?
  ..bookingId = json['bookingId'] as String?
  ..firstId = json['firstId'] as String?
  ..secondId = json['secondId'] as String?
  ..rating = json['rating'] as int?
  ..content = json['content'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..firstInfo = json['firstInfo'] == null
      ? null
      : User.fromJson(json['firstInfo'] as Map<String, dynamic>)
  ..secondInfo = json['secondInfo'] == null
      ? null
      : User.fromJson(json['secondInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'firstId': instance.firstId,
      'secondId': instance.secondId,
      'rating': instance.rating,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'firstInfo': instance.firstInfo?.toJson(),
      'secondInfo': instance.secondInfo?.toJson(),
    };
