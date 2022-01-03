import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/user.dart';

part 'schedule_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleInfo {
  String? id;
  String? tutorId;
  String? startTime;
  String? endTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? date;
  int? startTimestamp;
  int? endTimestamp;
  User? tutorInfo;
  ScheduleInfo();
  factory ScheduleInfo.fromJson(Map<String, dynamic> json) =>
      _$ScheduleInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleInfoToJson(this);
}
