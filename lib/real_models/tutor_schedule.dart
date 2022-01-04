import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/schedule_detail.dart';

part 'tutor_schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class TutorSchedule {
  String? id;
  String? tutorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isBooked;
  int? startTimestamp;
  int? endTimestamp;
  String? startTime;
  String? endTime;
  @JsonKey(nullable: true)
  List<ScheduleDetail>? scheduleDetails;
  TutorSchedule();
  factory TutorSchedule.fromJson(Map<String, dynamic> json) =>
      _$TutorScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$TutorScheduleToJson(this);
}
