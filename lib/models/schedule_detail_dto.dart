import 'package:json_annotation/json_annotation.dart';
import 'package:lettutor/models/booking_dto.dart';

part 'schedule_detail_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ScheduleDetailDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? endPeriod;
  int? endPeriodTimestamp;
  String? scheduleId;
  String? startPeriod;
  int? startPeriodTimestamp;
  @JsonKey(nullable: true)
  List<BookingDTO>? bookingInfo;
  bool? isBooked;
  ScheduleDetailDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.endPeriod,
      this.endPeriodTimestamp,
      this.scheduleId,
      this.startPeriod,
      this.startPeriodTimestamp,
      this.bookingInfo,
      this.isBooked);
  factory ScheduleDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDetailDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ScheduleDetailDTOToJson(this);
}
