import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/book_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/message_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/report_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/reviews_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/twolines_button.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TutorDetails extends StatefulWidget {
  const TutorDetails({Key? key}) : super(key: key);

  @override
  _TutorDetailsState createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
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

  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                            "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topRight,
                          child: CountryCodePicker(
                            initialSelection: dummy.countryCode,
                            showOnlyCountryWhenClosed: true,
                            enabled: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          dummy.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: RatingBar.builder(
                      initialRating: dummy.rating,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 20,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                      ignoreGestures: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      dummy.summary,
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(bottom: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TwoLinesButton(
                                btnText: i18n!.messageBtnText,
                                icon: Icons.chat_outlined,
                                textSize: 20,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.messageBtnText,
                                    MessageTutorDialog(),
                                  ),
                                },
                              ),
                              TwoLinesButton(
                                btnText: i18n.favoriteBtnText,
                                icon: _isFavorited == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                textSize: 20,
                                onTap: () {
                                  setState(() {
                                    _isFavorited = !_isFavorited;
                                  });
                                },
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.black26,
                            thickness: 0.5,
                            indent: 50,
                            endIndent: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TwoLinesButton(
                                btnText: i18n.reportBtnText,
                                icon: Icons.report_gmailerrorred,
                                textSize: 20,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.reportBtnText + " " + dummy.name,
                                    ReportTutorDialog(),
                                  ),
                                },
                              ),
                              TwoLinesButton(
                                btnText: i18n.reviewsBtnText,
                                icon: Icons.star_border,
                                textSize: 20,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.reviewsBtnText,
                                    ReviewsTutorDialog(),
                                  ),
                                },
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      i18n.profileStepSpecialtiesField,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TagsList(
                      tagsList: dummy.specialities.toList(),
                      readOnly: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      i18n.profileStepLanguagesField,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TagsList(
                      tagsList: dummy.tutorLanguages.toList(),
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                i18n.profileStepInterestsField,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                dummy.interests,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                i18n.profileStepExperienceField,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                dummy.experience,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                i18n.bookTutorBtnText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              child: SfCalendar(
                view: CalendarView.day,
                showDatePickerButton: true,
                showCurrentTimeIndicator: false,
                dataSource: _getCalendarDataSource(),
                allowAppointmentResize: true,
                appointmentBuilder: (context, calendarAppointmentDetails) {
                  var appointment =
                      calendarAppointmentDetails.appointments.first;
                  print(appointment);
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
                                i18n.bookTutorBtnText,
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
          ],
        ),
      ),
    );
  }
}

/* DUMMY  */
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

Tutor dummy = Tutor(
  "1",
  "Jill Leano",
  3.0,
  "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy t focus on my learner's goal.",
  ["English for kids", "English for business", "Conversational", "STARTERS"],
  "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
  "VN",
  ["English"],
  "Finance, gardening, travelling",
  "5 years of English teaching experience ",
);
/*DUMMY DATA */
