import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/user.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class Feedback {
  String? id;
  String? bookingId;
  String? firstId;
  String? secondId;
  int? rating;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  User? firstInfo;
  User? secondInfo;
  Feedback();
  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
