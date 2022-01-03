import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/real_models/schedule_info.dart';

part 'schedule_detail.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleDetail {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? startPeriodTimestamp;
  int? endPeriodTimestamp;
  String? startPeriod;
  String? endPeriod;
  ScheduleInfo? scheduleInfo;
  ScheduleDetail();
  factory ScheduleDetail.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailToJson(this);
}
