import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/feedback.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/real_models/wallet.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  String? email;
  String? name;
  String? avatar;
  String? country;
  String? phone;
  @JsonKey(nullable: true)
  List<String>? roles;
  String? language;
  String? birthday;
  bool? isActivated;
  Wallet? walletInfo;
  String? level;
  int? timezone;
  bool? isPhoneActivated;
  DateTime? createdAt;
  DateTime? updatedAt;
  @JsonKey(nullable: true)
  List<Feedback>? feedbacks;
  Tutor? tutorInfo;
  User();
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
