// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDTO _$CategoryDTOFromJson(Map<String, dynamic> json) => CategoryDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['title'] as String?,
      json['description'] as String?,
      json['key'] as String?,
    );

Map<String, dynamic> _$CategoryDTOToJson(CategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'title': instance.title,
      'description': instance.description,
      'key': instance.key,
    };
