import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/feedback.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/real_models/wallet.dart';

part 'tutor.g.dart';

@JsonSerializable(explicitToJson: true)
class Tutor {
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
  bool? requestPassword;
  DateTime? deletedAt;
  String? userId;
  String? video;
  String? bio;
  String? education;
  String? experience;
  String? profession;
  String? targetStudent;
  String? accent;
  String? interests;
  String? languages;
  String? specialties;
  String? resume;
  bool? isNative;
  int? price;
  bool? isOnline;
  @JsonKey(name: "User")
  User? user;
  bool? isFavorite;
  double? avgRating;
  Tutor();
  factory Tutor.fromJson(Map<String, dynamic> json) => _$TutorFromJson(json);
  Map<String, dynamic> toJson() => _$TutorToJson(this);
}
