import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/schedule/note_dialog.dart';

class LessonsListTile extends StatefulWidget {
  const LessonsListTile({Key? key}) : super(key: key);

  @override
  _LessonsListTileState createState() => _LessonsListTileState();
}

class _LessonsListTileState extends State<LessonsListTile> {
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
              child: Text(
                i18n!.schedulePageLessonTime("03:30", "03:55"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 35,
              margin: EdgeInsets.only(bottom: 10),
              child: CustomizedButton(
                borderRadius: 5,
                btnText: i18n.cancelBtnText,
                icon: Icons.disabled_by_default,
                primaryColor: Colors.red,
                horizontalPadding: 0,
                verticalPadding: 0,
                textSize: 17,
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
                  decoration: BoxDecoration(
                    color: Color(0xfff0f0f0),
                  ),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 8,
                                top: 8,
                                bottom: 8,
                              ),
                              child: Text(
                                i18n.schedulePageRequestForLesson,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  CustomizedButton(
                                    hasBorder: false,
                                    btnText: i18n.editBtnText,
                                    background: Colors.transparent,
                                    textSize: 16,
                                    horizontalPadding: 0,
                                    verticalPadding: 0,
                                    onTap: () => {
                                      displayDialog(
                                        context,
                                        i18n.noteDialogHeader,
                                        NoteDialog(),
                                      ),
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        i18n.schedulePageEmptyRequest, // will show this if there is no notes
                        style: TextStyle(
                          color: Color(0xff8399a7),
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
