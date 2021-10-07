import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/screens/sign_in/sign_in_form.dart';
import 'package:lettutor/screens/sign_in/third_party_sign_in.dart';
import 'package:lettutor/widgets/common/header/index.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _showPassword = false;
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
                Container(
                  child: Image.asset('assets/images/sign_in.png'),
                  padding: EdgeInsets.only(bottom: 30),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 14),
                  child: Text(
                    i18n!.signInTitle,
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff0071f0),
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 7.5),
                  child: Text(
                    i18n.signInDescription,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff2a3453),
                      fontFamily: 'Poppins',
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SignInForm(),
                ThirdPartySignIn(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
