import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/tokens.dart';
import 'package:lettutor/real_models/user.dart';

part 'auth.g.dart';

@JsonSerializable(explicitToJson: true)
class Auth {
  User? user;
  Tokens? tokens;
  Auth();
  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
