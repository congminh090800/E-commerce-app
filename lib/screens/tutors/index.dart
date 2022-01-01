import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';
import 'package:lettutor/widgets/tutors/welcome_banner.dart';
import 'package:provider/provider.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  List<Tutor> tutorsList = [];
  @override
  void initState() {
    super.initState();
    this.getFavoriteTutor();
    inspect(tutorsList);
  }

  void getFavoriteTutor() {
    try {
      var dio = Http().client;
      var query = {
        'perPage': '1',
        'page': '1',
      };
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        var accessToken = Provider.of<AuthProvider>(context, listen: false)
            .auth
            .tokens!
            .access!
            .token;
        dio.options.headers["Authorization"] = "Bearer $accessToken";
        var res = await dio.get(
          "tutor/more",
          queryParameters: query,
        );
        Iterable i = res.data["favoriteTutor"];
        List<Tutor>? result = List<Tutor>.from(
          await Future.wait(
            i.map(
              (tutor) async {
                if (tutor["secondInfo"] != null) {
                  String id = tutor["secondId"];
                  var tutorRes = await dio.get("tutor/$id");
                  var detail = tutorRes.data;
                  var data = Tutor.fromJson(detail);
                  return data;
                } else {
                  return Tutor();
                }
              },
            ),
          ),
        ).where((element) => element.id != null).toList();
        setState(() {
          tutorsList = result;
        });
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    inspect(tutorsList);
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
                          tutors: tutorsList,
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
