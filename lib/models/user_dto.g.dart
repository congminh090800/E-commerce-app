// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => UserDTO(
      json['id'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['avatar'] as String?,
      json['avgRating'] as int?,
      json['birthday'] as String?,
      json['country'] as String?,
      json['email'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['language'] as String?,
      json['isActivated'] as bool?,
      json['tutorInfo'] == null
          ? null
          : TutorDTO.fromJson(json['tutorInfo'] as Map<String, dynamic>),
      json['walletInfo'] == null
          ? null
          : WalletDTO.fromJson(json['walletInfo'] as Map<String, dynamic>),
      (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => FeedbackDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['requireNote'] as String?,
      json['level'] as String?,
      json['isPhoneActivated'] as bool?,
      json['timezone'] as int?,
      json['priceOfEachSession'] == null
          ? null
          : PriceDTO.fromJson(
              json['priceOfEachSession'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'avatar': instance.avatar,
      'avgRating': instance.avgRating,
      'birthday': instance.birthday,
      'country': instance.country,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'roles': instance.roles,
      'language': instance.language,
      'isActivated': instance.isActivated,
      'tutorInfo': instance.tutorInfo?.toJson(),
      'walletInfo': instance.walletInfo?.toJson(),
      'feedbacks': instance.feedbacks?.map((e) => e.toJson()).toList(),
      'requireNote': instance.requireNote,
      'level': instance.level,
      'isPhoneActivated': instance.isPhoneActivated,
      'timezone': instance.timezone,
      'priceOfEachSession': instance.priceOfEachSession?.toJson(),
    };
