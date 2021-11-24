class BookingDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  bool? isDeleted;
  String? recordUrl;
  String? scheduleDetailId;
  String? scoreByTutor;
  String? studentMeetingLin;
  String? studentRequest;
  String? tutorMeetingLink;
  String? tutorReview;
  String? userId;

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
      this.userId);
}
