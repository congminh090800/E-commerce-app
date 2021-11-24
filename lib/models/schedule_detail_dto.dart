import 'package:lettutor/models/booking_dto.dart';

class ScheduleDetailDTO {
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? endPeriod;
  int? endPeriodTimestamp;
  String? scheduleId;
  String? startPeriod;
  int? startPeriodTimestamp;
  List<BookingDTO> bookingInfo = [];

  ScheduleDetailDTO(
      this.id,
      this.createdAt,
      this.updatedAt,
      this.endPeriod,
      this.endPeriodTimestamp,
      this.scheduleId,
      this.startPeriod,
      this.startPeriodTimestamp,
      this.bookingInfo);
}
