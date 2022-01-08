// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseDTO _$CourseDTOFromJson(Map<String, dynamic> json) => CourseDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['name'] as String?,
      json['description'] as String?,
      json['imageUrl'] as String?,
      json['level'] as String?,
      json['reason'] as String?,
      json['purpose'] as String?,
      json['other_details'] as String?,
      json['default_price'] as int?,
      json['course_price'] as int?,
      json['visible'] as bool?,
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['topics'] as List<dynamic>?)
          ?.map((e) => TopicDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CourseDTOToJson(CourseDTO instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'level': instance.level,
      'reason': instance.reason,
      'purpose': instance.purpose,
      'other_details': instance.other_details,
      'default_price': instance.default_price,
      'course_price': instance.course_price,
      'visible': instance.visible,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'topics': instance.topics?.map((e) => e.toJson()).toList(),
    };
