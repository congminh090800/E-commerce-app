// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tokens _$TokensFromJson(Map<String, dynamic> json) => Tokens()
  ..access = json['access'] == null
      ? null
      : Token.fromJson(json['access'] as Map<String, dynamic>)
  ..refresh = json['refresh'] == null
      ? null
      : Token.fromJson(json['refresh'] as Map<String, dynamic>);

Map<String, dynamic> _$TokensToJson(Tokens instance) => <String, dynamic>{
      'access': instance.access?.toJson(),
      'refresh': instance.refresh?.toJson(),
    };
