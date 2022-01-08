// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDTO _$TopicDTOFromJson(Map<String, dynamic> json) => TopicDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['courseId'] as String?,
      json['orderCourse'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['videoUrl'] as String?,
    );

Map<String, dynamic> _$TopicDTOToJson(TopicDTO instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'courseId': instance.courseId,
      'orderCourse': instance.orderCourse,
      'name': instance.name,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
    };
