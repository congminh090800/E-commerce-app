import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/feedback_dto.dart';
import 'package:lettutor/models/price_dto.dart';
import 'package:lettutor/models/tutor_dto.dart';
import 'package:lettutor/models/wallet_dto.dart';

part 'user_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class UserDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? avatar;
  int? avgRating;
  String? birthday;
  String? country;
  String? email;
  String? name;
  String? phone;
  @JsonKey(nullable: true)
  List<String>? roles;
  String? language;
  bool? isActivated;
  TutorDTO? tutorInfo;
  WalletDTO? walletInfo;
  @JsonKey(nullable: true)
  List<FeedbackDTO>? feedbacks;
  String? requireNote;
  String? level;
  bool? isPhoneActivated;
  int? timezone;
  PriceDTO? priceOfEachSession;

  UserDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.avatar,
      this.avgRating,
      this.birthday,
      this.country,
      this.email,
      this.name,
      this.phone,
      this.roles,
      this.language,
      this.isActivated,
      this.tutorInfo,
      this.walletInfo,
      this.feedbacks,
      this.requireNote,
      this.level,
      this.isPhoneActivated,
      this.timezone,
      this.priceOfEachSession);
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);
}
