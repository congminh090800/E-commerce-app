// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WalletDTO _$WalletDTOFromJson(Map<String, dynamic> json) => WalletDTO(
      json['id'] as String?,
      json['userId'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['amount'] as String?,
      json['bonus'] as int?,
      json['isBlocked'] as bool?,
    );

Map<String, dynamic> _$WalletDTOToJson(WalletDTO instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'amount': instance.amount,
      'bonus': instance.bonus,
      'isBlocked': instance.isBlocked,
    };
