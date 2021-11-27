import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/schedule_dto.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'book_tutor_dialog.dart';

class BookCalendarDialog extends StatefulWidget {
  const BookCalendarDialog({Key? key}) : super(key: key);

  @override
  _BookCalendarDialogState createState() => _BookCalendarDialogState();
}

class _BookCalendarDialogState extends State<BookCalendarDialog> {
  List<ScheduleDTO> schedules = [];
  _AppointmentDataSource? appointmentData;
  Future<void> loadJsonData() async {
    var jsonText =
        await rootBundle.loadString("assets/schedule_calendar_dummy.json");
    Iterable i = jsonDecode(jsonText);
    List<ScheduleDTO>? result = List<ScheduleDTO>.from(
        i.map((schedule) => ScheduleDTO.fromJson(schedule)));
    setState(() {
      if (result == null) {
        schedules = [];
      } else {
        schedules = result;
      }
    });
    this.getCalendarTiles();
  }

  void getCalendarTiles() {
    List<Appointment> appointments = <Appointment>[];
    for (var schedule in schedules) {
      for (var detail in schedule.scheduleDetails!) {
        appointments.add(Appointment(
          startTime:
              DateTime.fromMillisecondsSinceEpoch(detail.startPeriodTimestamp!)
                  .toLocal(),
          endTime:
              DateTime.fromMillisecondsSinceEpoch(detail.endPeriodTimestamp!)
                  .toLocal(),
          startTimeZone: '',
          endTimeZone: '',
          subject: detail.isBooked! ? 'Reserved' : 'Book',
          id: detail.id,
        ));
      }
    }
    this.setState(() {
      appointmentData = _AppointmentDataSource(appointments);
    });
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SafeArea(
      top: false,
      child: Container(
        child: SfCalendar(
          cellBorderColor: Colors.black,
          view: CalendarView.day,
          showDatePickerButton: true,
          showCurrentTimeIndicator: false,
          dataSource: this.appointmentData,
          allowAppointmentResize: true,
          appointmentBuilder: (context, calendarAppointmentDetails) {
            var appointment = calendarAppointmentDetails.appointments.first;
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: CustomizedButton(
                      btnText: appointment.subject,
                      background: Colors.blue,
                      primaryColor: Colors.white,
                      onTap: () {
                        print(appointment.toString());
                        displayDialog(
                          context,
                          i18n!.bookTutorBtnText,
                          BookTutorDialog(data: appointment),
                        );
                      },
                      isDisabled: appointment.subject == 'Reserved',
                    ),
                  ),
                ],
              ),
            );
          },
          timeSlotViewSettings: TimeSlotViewSettings(
            startHour: 8,
            endHour: 23,
            timeIntervalHeight: 100,
            timeRulerSize: 100,
            timeTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            timeInterval: Duration(
              minutes: 25,
            ),
            timeFormat: "hh:mm",
          ),
        ),
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[];
  DateTime rigtNow = DateTime.now();
  appointments.add(Appointment(
    startTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 8, 0, 0, 0, 0)
        .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 8, 25, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Book',
  ));
  appointments.add(Appointment(
    startTime:
        DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 8, 26, 0, 0, 0)
            .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 8, 50, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Book',
  ));
  appointments.add(Appointment(
    startTime:
        DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 8, 51, 0, 0, 0)
            .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 9, 15, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Reserved',
  ));
  appointments.add(Appointment(
    startTime:
        DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 9, 16, 0, 0, 0)
            .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 9, 40, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Book',
  ));
  appointments.add(Appointment(
    startTime:
        DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 9, 41, 0, 0, 0)
            .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 10, 5, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Book',
  ));
  appointments.add(Appointment(
    startTime:
        DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 10, 6, 0, 0, 0)
            .toLocal(),
    endTime: DateTime(rigtNow.year, rigtNow.month, rigtNow.day, 10, 30, 0, 0, 0)
        .toLocal(),
    startTimeZone: '',
    endTimeZone: '',
    subject: 'Book',
  ));
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

displayDialog(BuildContext context, String title, Widget content) {
  Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) =>
          FullScreenDialog(title: title, content: content),
      fullscreenDialog: true,
    ),
  );
}
