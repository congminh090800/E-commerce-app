// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['id'] as String?
  ..email = json['email'] as String?
  ..name = json['name'] as String?
  ..avatar = json['avatar'] as String?
  ..country = json['country'] as String?
  ..phone = json['phone'] as String?
  ..roles = (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList()
  ..language = json['language'] as String?
  ..birthday = json['birthday'] as String?
  ..isActivated = json['isActivated'] as bool?
  ..walletInfo = json['walletInfo'] == null
      ? null
      : Wallet.fromJson(json['walletInfo'] as Map<String, dynamic>)
  ..level = json['level'] as String?
  ..timezone = json['timezone'] as int?
  ..isPhoneActivated = json['isPhoneActivated'] as bool?
  ..createdAt = json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String)
  ..updatedAt = json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String)
  ..feedbacks = (json['feedbacks'] as List<dynamic>?)
      ?.map((e) => Feedback.fromJson(e as Map<String, dynamic>))
      .toList()
  ..tutorInfo = json['tutorInfo'] == null
      ? null
      : Tutor.fromJson(json['tutorInfo'] as Map<String, dynamic>);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'avatar': instance.avatar,
      'country': instance.country,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'birthday': instance.birthday,
      'isActivated': instance.isActivated,
      'walletInfo': instance.walletInfo?.toJson(),
      'level': instance.level,
      'timezone': instance.timezone,
      'isPhoneActivated': instance.isPhoneActivated,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'feedbacks': instance.feedbacks?.map((e) => e.toJson()).toList(),
      'tutorInfo': instance.tutorInfo?.toJson(),
    };
