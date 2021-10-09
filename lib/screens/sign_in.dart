import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/authentication/intro_section.dart';
import 'package:lettutor/widgets/authentication/login_form.dart';
import 'package:lettutor/widgets/authentication/third_party_sign_in.dart';
import 'package:lettutor/widgets/common/header/index.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Header(
      screen: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 35, 10, 0),
          child: Container(
            padding: EdgeInsets.fromLTRB(22.5, 15, 22.5, 15),
            child: Column(
              children: [
                AuthenScreenIntro(isSignIn: true),
                LoginForm(),
                ThirdPartySignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
