import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/profile/avatar_section.dart';
import 'package:lettutor/widgets/profile/common_information.dart';
import 'package:lettutor/widgets/profile/tutor_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Column(
          children: [
            AvatarSection(
              user: widget.user,
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
              user: widget.user,
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
            TutorInformation(
              user: widget.user,
            ),
          ],
        ),
      ),
    );
  }
}
