import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/authentication/intro_section.dart';
import 'package:lettutor/widgets/authentication/signup_form.dart';
import 'package:lettutor/widgets/authentication/third_party_sign_in.dart';
import 'package:lettutor/widgets/common/header/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                AuthenScreenIntro(isSignIn: false),
                SignUpForm(),
                ThirdPartySignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
