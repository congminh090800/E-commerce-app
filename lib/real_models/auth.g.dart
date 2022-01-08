// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) => Auth()
  ..user = json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>)
  ..tokens = json['tokens'] == null
      ? null
      : Tokens.fromJson(json['tokens'] as Map<String, dynamic>);

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'user': instance.user?.toJson(),
      'tokens': instance.tokens?.toJson(),
    };
