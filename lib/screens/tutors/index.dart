import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';
import 'package:lettutor/widgets/tutors/welcome_banner.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeBanner(),
          Container(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(
                  color: Colors.black54,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            i18n!.recommendedTutors,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 25,
                              color: Color(0xff3c3c3c),
                            ),
                          ),
                        ),
                        TutorsList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
