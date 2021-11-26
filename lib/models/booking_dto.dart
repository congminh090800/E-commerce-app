import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/schedule_detail_dto.dart';

part 'booking_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class BookingDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  bool? isDeleted;
  String? recordUrl;
  String? scheduleDetailId;
  int? scoreByTutor;
  String? studentMeetingLin;
  String? studentRequest;
  String? tutorMeetingLink;
  String? tutorReview;
  String? userId;
  ScheduleDetailDTO? scheduleDetailInfo;

  BookingDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.createdAtTimeStamp,
      this.updatedAtTimeStamp,
      this.isDeleted,
      this.recordUrl,
      this.scheduleDetailId,
      this.scoreByTutor,
      this.studentMeetingLin,
      this.studentRequest,
      this.tutorMeetingLink,
      this.tutorReview,
      this.userId,
      this.scheduleDetailInfo);
  factory BookingDTO.fromJson(Map<String, dynamic> json) =>
      _$BookingDTOFromJson(json);
  Map<String, dynamic> toJson() => _$BookingDTOToJson(this);
}
