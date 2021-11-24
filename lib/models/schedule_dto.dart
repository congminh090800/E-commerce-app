import 'package:lettutor/models/schedule_detail_dto.dart';

class ScheduleDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? date;
  String? endTime;
  int? endTimestamp;
  String? startTime;
  int? startTimestamp;
  String? tutorId;
  List<ScheduleDetailDTO> scheduleDetailInfo = [];

  ScheduleDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.date,
      this.endTime,
      this.endTimestamp,
      this.startTime,
      this.startTimestamp,
      this.tutorId,
      this.scheduleDetailInfo);
}
