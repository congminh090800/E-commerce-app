import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
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
                  i18n!.totalLessonTimeBanner(12.toString(), 44.toString()),
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
                          DateTime.now(),
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
                                builder: (context) => VideoCallRoom()),
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
