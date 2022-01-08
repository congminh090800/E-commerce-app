// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceDTO _$PriceDTOFromJson(Map<String, dynamic> json) => PriceDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['key'] as String?,
      json['price'] as String?,
    );

Map<String, dynamic> _$PriceDTOToJson(PriceDTO instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'key': instance.key,
      'price': instance.price,
    };
