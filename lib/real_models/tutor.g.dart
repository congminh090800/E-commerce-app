// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tutor _$TutorFromJson(Map<String, dynamic> json) => Tutor()
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
  ..requestPassword = json['requestPassword'] as bool?
  ..deletedAt = json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String)
  ..userId = json['userId'] as String?
  ..video = json['video'] as String?
  ..bio = json['bio'] as String?
  ..education = json['education'] as String?
  ..experience = json['experience'] as String?
  ..profession = json['profession'] as String?
  ..targetStudent = json['targetStudent'] as String?
  ..accent = json['accent'] as String?
  ..interests = json['interests'] as String?
  ..languages = json['languages'] as String?
  ..specialties = json['specialties'] as String?
  ..resume = json['resume'] as String?
  ..isNative = json['isNative'] as bool?
  ..price = json['price'] as int?
  ..isOnline = json['isOnline'] as bool?
  ..user = json['User'] == null
      ? null
      : User.fromJson(json['User'] as Map<String, dynamic>)
  ..isFavorite = json['isFavorite'] as bool?
  ..avgRating = (json['avgRating'] as num?)?.toDouble();

Map<String, dynamic> _$TutorToJson(Tutor instance) => <String, dynamic>{
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
      'requestPassword': instance.requestPassword,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'userId': instance.userId,
      'video': instance.video,
      'bio': instance.bio,
      'education': instance.education,
      'experience': instance.experience,
      'profession': instance.profession,
      'targetStudent': instance.targetStudent,
      'accent': instance.accent,
      'interests': instance.interests,
      'languages': instance.languages,
      'specialties': instance.specialties,
      'resume': instance.resume,
      'isNative': instance.isNative,
      'price': instance.price,
      'isOnline': instance.isOnline,
      'User': instance.user?.toJson(),
      'isFavorite': instance.isFavorite,
      'avgRating': instance.avgRating,
    };
