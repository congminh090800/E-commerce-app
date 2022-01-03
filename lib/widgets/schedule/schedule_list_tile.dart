import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/real_models/schedule.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/schedule/lessons_list_tile.dart';
import 'package:lettutor/widgets/tutors/message_tutor_dialog.dart';
import 'package:provider/provider.dart';

class ScheduleListTile extends StatefulWidget {
  const ScheduleListTile(
      {Key? key, required this.schedule, required this.onUpdate})
      : super(key: key);
  final Schedule schedule;
  final Function onUpdate;
  @override
  _ScheduleListTileState createState() => _ScheduleListTileState();
}

class _ScheduleListTileState extends State<ScheduleListTile> {
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

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        var provider = Provider.of<LocaleProvider>(context);
        return Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Color.fromRGBO(241, 241, 241, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  DateFormat(
                    'EE, dd MMM y',
                    provider.locale.toString(),
                  ).format(
                    DateTime.fromMillisecondsSinceEpoch(widget.schedule
                            .scheduleDetailInfo?.startPeriodTimestamp ??
                        0),
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(
              //     bottom: 20,
              //   ),
              //   child: Text(
              //     i18n!.schedulePageNumOfLesson(2.toString()),
              //     textAlign: TextAlign.left,
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 70,
                            height: 70,
                            child: CircleAvatar(
                              radius: 70,
                              backgroundImage: NetworkImage(
                                widget.schedule.scheduleDetailInfo?.scheduleInfo
                                        ?.tutorInfo?.avatar ??
                                    "",
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 6),
                              child: Text(
                                widget.schedule.scheduleDetailInfo?.scheduleInfo
                                        ?.tutorInfo?.name ??
                                    "",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  child: CountryCodePicker(
                                    initialSelection: widget
                                            .schedule
                                            .scheduleDetailInfo
                                            ?.scheduleInfo
                                            ?.tutorInfo
                                            ?.country ??
                                        "VN",
                                    showOnlyCountryWhenClosed: true,
                                    enabled: false,
                                    padding: EdgeInsets.all(0),
                                    alignLeft: false,
                                  ),
                                ),
                                Container(
                                  child: TextButton(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.chat_outlined,
                                          size: 20,
                                          color: Colors.blue,
                                        ),
                                        Text(
                                          " " + i18n!.schedulePageDirectMessage,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onPressed: () => {
                                      displayDialog(
                                        context,
                                        i18n.messageTutorBtnText,
                                        MessageTutorDialog(),
                                      ),
                                    },
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                primary: false,
                children: [
                  LessonsListTile(
                    schedule: widget.schedule,
                    onUpdate: () {
                      widget.onUpdate();
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 150,
                    alignment: Alignment.centerRight,
                    child: CustomizedButton(
                      btnText: i18n.schedulePageGoToBtnText,
                      borderRadius: 5,
                      horizontalPadding: 5,
                      background: Colors.blue,
                      primaryColor: Colors.white,
                      hasBorder: false,
                      isDisabled: true,
                      textSize: 15,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              )
            ],
          ),
        );
      },
    );
  }
}
