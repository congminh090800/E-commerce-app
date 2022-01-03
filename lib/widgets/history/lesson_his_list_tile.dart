import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/real_models/schedule.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';

class LessonHistoryListTile extends StatefulWidget {
  const LessonHistoryListTile({Key? key, required this.schedule})
      : super(key: key);
  final Schedule schedule;
  @override
  _LessonHistoryListTileState createState() => _LessonHistoryListTileState();
}

class _LessonHistoryListTileState extends State<LessonHistoryListTile> {
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
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                i18n!.schedulePageLessonTime(
                    widget.schedule.scheduleDetailInfo?.startPeriod ?? "00: 00",
                    widget.schedule.scheduleDetailInfo?.endPeriod ?? "00: 00"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Table(
              border: TableBorder.all(
                color: Color(0xfff0f0f0),
                style: BorderStyle.solid,
                width: 1,
              ),
              children: [
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        widget.schedule.studentRequest == null
                            ? i18n.historyPageNoRequest
                            : (widget.schedule.studentRequest ??
                                ""), // will show this if there is no notes
                        style: TextStyle(
                          color: Color(0xff8399a7),
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        widget.schedule.tutorReview == null
                            ? i18n.historyPageNoReview
                            : (widget.schedule.tutorReview ??
                                ""), // will show this if there is no notes
                        style: TextStyle(
                          color: Color(0xff8399a7),
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
