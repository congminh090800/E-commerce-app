import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/models/booking_dto.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/screens/videocall.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:provider/provider.dart';

class WelcomeBanner extends StatefulWidget {
  const WelcomeBanner({Key? key}) : super(key: key);

  @override
  _WelcomeBannerState createState() => _WelcomeBannerState();
}

class _WelcomeBannerState extends State<WelcomeBanner> {
  BookingDTO? booking;
  double totalLearntTime = 0;
  Future<void> loadBookingJson() async {
    var jsonText = await rootBundle.loadString("assets/booking_dummy.json");
    Iterable i = jsonDecode(jsonText);
    List<BookingDTO>? result = List<BookingDTO>.from(
        i.map((bookingInfo) => BookingDTO.fromJson(bookingInfo)));
    setState(() {
      booking = result.length > 0 ? result.elementAt(0) : null;
    });
  }

  void getTotalTime() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
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
    });
  }

  DateTime getNearest() {
    DateTime next = DateTime.now();
    if (booking != null && booking!.scheduleDetailInfo != null) {
      int startTime = booking!.scheduleDetailInfo!.startPeriodTimestamp!;
      next = DateTime.fromMillisecondsSinceEpoch(startTime);
    }
    return next;
  }

  @override
  void initState() {
    super.initState();
    this.loadBookingJson();
    this.getTotalTime();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
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
              Container(
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
                          getNearest(),
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
                                      startTimeStamp:
                                          getNearest().millisecondsSinceEpoch,
                                    )),
                          ),
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
