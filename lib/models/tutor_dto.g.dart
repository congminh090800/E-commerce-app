// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TutorDTO _$TutorDTOFromJson(Map<String, dynamic> json) => TutorDTO(
      json['id'] as String?,
      json['userId'] as String?,
      json['avatar'] as String?,
      json['bio'] as String?,
      json['birthDay'] == null
          ? null
          : DateTime.parse(json['birthDay'] as String),
      json['country'] as String?,
      json['education'] as String?,
      json['email'] as String?,
      json['experience'] as String?,
      json['facebook'] as String?,
      (json['feedbacks'] as List<dynamic>?)
          ?.map((e) => FeedbackDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['google'] as String?,
      json['interests'] as String?,
      json['isActivated'] as bool?,
      json['isNative'] as bool?,
      json['isPhoneActivated'] as bool?,
      json['isPhoneAuthActivated'] as bool?,
      json['language'] as String?,
      json['languages'] as String?,
      json['level'] as String?,
      json['name'] as String?,
      json['phone'] as String?,
      json['phoneAuth'] as String?,
      json['price'] as int?,
      json['profession'] as String?,
      json['requestPassword'] as bool?,
      json['requireNote'] as String?,
      json['resume'] as String?,
      (json['schedules'] as List<dynamic>?)
          ?.map((e) => ScheduleDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['specialties'] as String?,
      json['targetStudent'] as String?,
      json['timezone'] as int?,
      json['video'] as String?,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TutorDTOToJson(TutorDTO instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'birthDay': instance.birthDay?.toIso8601String(),
      'country': instance.country,
      'education': instance.education,
      'email': instance.email,
      'experience': instance.experience,
      'facebook': instance.facebook,
      'feedbacks': instance.feedbacks?.map((e) => e.toJson()).toList(),
      'google': instance.google,
      'interests': instance.interests,
      'isActivated': instance.isActivated,
      'isNative': instance.isNative,
      'isPhoneActivated': instance.isPhoneActivated,
      'isPhoneAuthActivated': instance.isPhoneAuthActivated,
      'language': instance.language,
      'languages': instance.languages,
      'level': instance.level,
      'name': instance.name,
      'phone': instance.phone,
      'phoneAuth': instance.phoneAuth,
      'price': instance.price,
      'profession': instance.profession,
      'requestPassword': instance.requestPassword,
      'requireNote': instance.requireNote,
      'resume': instance.resume,
      'schedules': instance.schedules?.map((e) => e.toJson()).toList(),
      'specialties': instance.specialties,
      'targetStudent': instance.targetStudent,
      'timezone': instance.timezone,
      'video': instance.video,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
