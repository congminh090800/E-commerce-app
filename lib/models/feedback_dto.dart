import 'package:lettutor/models/tutor_dto.dart';

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
}
