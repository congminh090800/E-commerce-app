import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/tutor_dto.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';
import 'package:lettutor/widgets/tutors/welcome_banner.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  List<TutorDTO> tutors = [];
  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString("assets/tutors_dummy.json");
    Iterable i = jsonDecode(jsonText);
    List<TutorDTO>? result =
        List<TutorDTO>.from(i.map((tutor) => TutorDTO.fromJson(tutor)));
    setState(() {
      if (result == null) {
        tutors = [];
      } else {
        tutors = result;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    inspect(tutors);
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
                        TutorsList(
                          tutors: this.tutors,
                        ),
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
