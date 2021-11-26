import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/tutor_dto.dart';

part 'feedback_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackDTO {
  String? id;
  String? bookingId;
  String? content;
  int? rating;
  String? firstId;
  String? secondId;
  DateTime? createdAt;
  DateTime? updatedAt;
  TutorDTO? firstInfo;

  FeedbackDTO(this.id, this.bookingId, this.content, this.rating, this.firstId,
      this.secondId, this.createdAt, this.updatedAt, this.firstInfo);
  factory FeedbackDTO.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDTOFromJson(json);
  Map<String, dynamic> toJson() => _$FeedbackDTOToJson(this);
}
