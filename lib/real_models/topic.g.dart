// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Topic _$TopicFromJson(Map<String, dynamic> json) => Topic()
  ..id = json['id'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..courseId = json['courseId'] as String?
  ..orderCourse = json['orderCourse'] as int?
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..videoUrl = json['videoUrl'] as String?;

Map<String, dynamic> _$TopicToJson(Topic instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'courseId': instance.courseId,
      'orderCourse': instance.orderCourse,
      'name': instance.name,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
    };
