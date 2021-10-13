import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/header/index.dart';
import 'package:lettutor/widgets/profile/avatar_section.dart';
import 'package:lettutor/widgets/profile/common_information.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Header(
      screen: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
          child: Column(
            children: [
              AvatarSection(),
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
              CommonInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
