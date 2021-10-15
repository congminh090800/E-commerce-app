import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/history/lesson_his_list_tile.dart';
import 'package:lettutor/widgets/tutors/message_tutor_dialog.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class HistoryListTile extends StatefulWidget {
  const HistoryListTile({Key? key}) : super(key: key);

  @override
  _HistoryListTileState createState() => _HistoryListTileState();
}

class _HistoryListTileState extends State<HistoryListTile> {
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
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
                    DateTime.now(),
                  ),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  timeago.format(DateTime.now()),
                  textAlign: TextAlign.left,
                ),
              ),
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
                                "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
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
                                "Keegan",
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
                                    initialSelection: 'VN',
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
                padding: EdgeInsets.only(top: 0),
                shrinkWrap: true,
                primary: false,
                children: [
                  LessonHistoryListTile(),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
