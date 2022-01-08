// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course()
  ..id = json['id'] as String?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..name = json['name'] as String?
  ..description = json['description'] as String?
  ..imageUrl = json['imageUrl'] as String?
  ..level = json['level'] as String?
  ..reason = json['reason'] as String?
  ..purpose = json['purpose'] as String?
  ..other_details = json['other_details'] as String?
  ..default_price = json['default_price'] as int?
  ..course_price = json['course_price'] as int?
  ..visible = json['visible'] as bool?
  ..categories = (json['categories'] as List<dynamic>?)
      ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
      .toList()
  ..topics = (json['topics'] as List<dynamic>?)
      ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
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
