import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/real_models/schedule.dart';
import 'package:lettutor/screens/videocall.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:provider/provider.dart';

class WelcomeBanner extends StatefulWidget {
  const WelcomeBanner({Key? key}) : super(key: key);

  @override
  _WelcomeBannerState createState() => _WelcomeBannerState();
}

class _WelcomeBannerState extends State<WelcomeBanner> {
  double totalLearntTime = 0;
  List<Schedule> scheduleList = [];
  Future<void> getTotalTime() async {
    var accessToken = Provider.of<AuthProvider>(context, listen: false)
        .auth
        .tokens!
        .access!
        .token;
    var dio = Http().client;
    dio.options.headers["Authorization"] = "Bearer $accessToken";
    var res = await dio.get("call/total");
    setState(() {
      totalLearntTime = res.data["total"].toDouble() ?? 0;
    });
  }

  Future<void> getLatestSchedule() async {
    try {
      print("in request");
      setState(() {
        scheduleList.clear();
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var query = {
        'page': 1,
        'perPage': 1,
        'dateTimeGte': DateTime.now().millisecondsSinceEpoch,
        'orderBy': 'meeting',
        'sortBy': 'asc'
      };
      var res = await dio.get("booking/list/student", queryParameters: query);
      inspect(res);
      Iterable i = res.data["data"]["rows"];
      List<Schedule> data =
          List<Schedule>.from(i.map((schedule) => Schedule.fromJson(schedule)));
      setState(() {
        scheduleList.addAll(data);
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await getTotalTime();
      await getLatestSchedule();
    });
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    var provider = Provider.of<LocaleProvider>(context);
    return Container(
      color: Color(0xff1640b5),
      alignment: Alignment.center,
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              i18n!.totalLessonTimeBanner(
                  (totalLearntTime / 60).floor().toString(),
                  (totalLearntTime.round() % 60).toString()),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Text(
              i18n.upcomingLessonBanner,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          scheduleList.length > 0
              ? Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Text(
                          DateFormat(
                            'hh:mm EEEE, dd MMMM y',
                            provider.locale.toString(),
                          ).format(
                            DateTime.fromMillisecondsSinceEpoch(scheduleList
                                    .first
                                    .scheduleDetailInfo
                                    ?.startPeriodTimestamp ??
                                0),
                          ),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: CustomizedButton(
                          btnText: i18n.enterLessonRoomBtnText,
                          icon: Icons.slideshow,
                          textSize: 20,
                          onTap: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => VideoCallRoom(
                                  startTimeStamp: scheduleList
                                          .first
                                          .scheduleDetailInfo
                                          ?.startPeriodTimestamp ??
                                      0,
                                ),
                              ),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
