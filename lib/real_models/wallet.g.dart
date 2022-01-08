// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet()
  ..id = json['id'] as String?
  ..userId = json['userId'] as String?
  ..amount = json['amount'] as String?
  ..isBlocked = json['isBlocked'] as bool?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..bonus = json['bonus'] as int?;

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'amount': instance.amount,
      'isBlocked': instance.isBlocked,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'bonus': instance.bonus,
    };
