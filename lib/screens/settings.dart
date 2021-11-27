import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/user_dto.dart';
import 'package:lettutor/screens/history.dart';
import 'package:lettutor/screens/home.dart';
import 'package:lettutor/screens/profile.dart';
import 'package:lettutor/screens/reset_password.dart';
import 'package:lettutor/screens/tutors/become_tutor.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/settings/select_lang_dialog.dart';
import 'package:lettutor/widgets/settings/setting_button.dart';
import 'package:lettutor/widgets/tutors/reviews_tutor_dialog.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  UserDTO? user;
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

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString("assets/user_dummy.json");
    Map<String, dynamic> mapper = jsonDecode(jsonText);
    UserDTO result = UserDTO.fromJson(mapper);
    setState(() {
      user = result;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    inspect(user);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n!.viewProfileBtnText,
                prefixIcon: Icons.person_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  displayDialog(
                    context,
                    i18n.viewProfileBtnText,
                    ProfilePage(),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n.viewFeedBackBtnText,
                prefixIcon: Icons.question_answer_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  displayDialog(
                    context,
                    i18n.viewFeedBackBtnText,
                    ReviewsTutorDialog(
                      feedbacks: user!.feedbacks,
                    ),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n.bookingHisBtnText,
                prefixIcon: Icons.history_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  displayDialog(
                    context,
                    i18n.bookingHisBtnText,
                    HistoryPage(),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n.advancedSettings,
                prefixIcon: Icons.settings_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  displayDialog(
                    context,
                    i18n.advancedSettings,
                    SelectLanguageDialog(),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n.becomeTutorBtnText,
                prefixIcon: Icons.school_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  displayDialog(
                    context,
                    i18n.becomeTutorBtnText,
                    BecomeTutorPage(),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: SettingButton(
                btnText: i18n.resetPasswordTitle,
                prefixIcon: Icons.lock_outlined,
                suffixIcon: Icons.chevron_right,
                iconSize: 25,
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoilerPlate(
                        page: ResetPasswordPage(),
                      ),
                    ),
                  ),
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, top: 20),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black12,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      i18n.logOutBtnText,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BoilerPlate(
                        page: HomePage(),
                      ),
                    ),
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
