import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/schedule_detail_dto.dart';

part 'schedule_dto.g.dart';

@JsonSerializable(explicitToJson: true)
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
  @JsonKey(nullable: true)
  List<ScheduleDetailDTO>? scheduleDetailInfo;
  @JsonKey(nullable: true)
  List<ScheduleDetailDTO>? scheduleDetails;
  bool? isBooked;

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
      this.scheduleDetailInfo,
      this.isBooked,
      this.scheduleDetails);
  factory ScheduleDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDTOToJson(this);
}
