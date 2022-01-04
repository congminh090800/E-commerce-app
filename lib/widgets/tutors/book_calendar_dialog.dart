import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/tutor_schedule.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'book_tutor_dialog.dart';

class BookCalendarDialog extends StatefulWidget {
  const BookCalendarDialog({Key? key, required this.tutorId}) : super(key: key);
  final tutorId;
  @override
  _BookCalendarDialogState createState() => _BookCalendarDialogState();
}

class _BookCalendarDialogState extends State<BookCalendarDialog> {
  _AppointmentDataSource? appointmentData;
  List<TutorSchedule> scheduleList = [];
  bool loading = true;

  void getCalendarTiles() {
    List<Appointment> appointments = <Appointment>[];
    for (var schedule in scheduleList) {
      for (var detail in (schedule.scheduleDetails!)) {
        appointments.add(Appointment(
          startTime:
              DateTime.fromMillisecondsSinceEpoch(detail.startPeriodTimestamp!)
                  .toLocal(),
          endTime:
              DateTime.fromMillisecondsSinceEpoch(detail.endPeriodTimestamp!)
                  .toLocal(),
          startTimeZone: '',
          endTimeZone: '',
          subject: ((detail.isBooked ?? false) ||
                      (detail.bookingInfo!.length > 0 &&
                          detail.bookingInfo!.first.isDeleted == false)) ||
                  DateTime.now().millisecondsSinceEpoch >=
                      (detail.startPeriodTimestamp ?? 0)
              ? 'Booked'
              : 'Book',
          id: detail.id,
        ));
      }
    }
    this.setState(() {
      appointmentData = _AppointmentDataSource(appointments);
    });
  }

  displayDialog(BuildContext context, String title, Widget content) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            FullScreenDialog(title: title, content: content),
        fullscreenDialog: true,
      ),
    ).then((value) async {
      await getTutorSchedule();
      getCalendarTiles();
    });
  }

  Future<void> getTutorSchedule() async {
    try {
      setState(() {
        loading = true;
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.post("schedule", data: {
        'tutorId': widget.tutorId,
      });
      Iterable i = res.data["data"];
      List<TutorSchedule> result = List<TutorSchedule>.from(
        i.map(
          (schedule) => TutorSchedule.fromJson(schedule),
        ),
      );
      setState(() {
        scheduleList = result;
      });
      this.getCalendarTiles();
      setState(() {
        loading = false;
      });
      inspect(scheduleList);
    } catch (e) {
      inspect(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await this.getTutorSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SafeArea(
      top: false,
      child: Container(
        child: loading == true
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
                margin: EdgeInsets.only(top: 20),
              )
            : SfCalendar(
                cellBorderColor: Colors.black,
                view: CalendarView.day,
                showDatePickerButton: true,
                showCurrentTimeIndicator: false,
                dataSource: this.appointmentData,
                allowAppointmentResize: true,
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  var appointment =
                      calendarAppointmentDetails.appointments.first;
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
                              displayDialog(
                                context,
                                i18n!.bookTutorBtnText,
                                BookTutorDialog(
                                  data: appointment,
                                ),
                              );
                            },
                            isDisabled: appointment.subject == 'Booked',
                          ),
                        ),
                      ],
                    ),
                  );
                },
                timeSlotViewSettings: TimeSlotViewSettings(
                  startHour: 0,
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
                  timeFormat: "HH:mm",
                ),
              ),
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
