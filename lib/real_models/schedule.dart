import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/schedule_detail.dart';

part 'schedule.g.dart';

@JsonSerializable(explicitToJson: true)
class Schedule {
  String? id;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? createdAtTimeStamp;
  int? updatedAtTimeStamp;
  String? scheduleDetailId;
  String? studentRequest;
  String? tutorReview;
  int? scoreByTutor;
  bool? isDeleted;
  ScheduleDetail? scheduleDetailInfo;
  Schedule();
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}
