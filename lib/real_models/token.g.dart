// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token()
  ..token = json['token'] as String?
  ..expires = json['expires'] == null
      ? null
      : DateTime.parse(json['expires'] as String);

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires?.toIso8601String(),
    };
