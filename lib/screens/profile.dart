import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/profile/avatar_section.dart';
import 'package:lettutor/widgets/profile/common_information.dart';
import 'package:lettutor/widgets/profile/tutor_information.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  bool? loading = false;
  Future<void> getUserDetail() async {
    try {
      setState(() {
        loading = true;
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.get("user/info");
      setState(() {
        user = User.fromJson(res.data["user"]);
        loading = false;
      });
    } catch (e) {
      inspect(e);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return user == null || loading == true
        ? Container(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Column(
                children: [
                  AvatarSection(
                    user: user ?? User(),
                    onUpdateInfo: () async {
                      await getUserDetail();
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 246, 250, 1),
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(i18n!.profilePageAccountSectionHeader),
                      ],
                    ),
                  ),
                  CommonInformation(
                    user: user!,
                    onUpdateInfo: () {
                      getUserDetail();
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 246, 250, 1),
                      border: Border.all(
                        color: Colors.black26,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(i18n.profilePageTutorInfoSectionHeader),
                      ],
                    ),
                  ),
                  user!.tutorInfo == null
                      ? Container()
                      : TutorInformation(
                          user: user!,
                          onUpdateInfo: () {
                            getUserDetail();
                          },
                        ),
                ],
              ),
            ),
          );
  }
}
