import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthenScreenIntro extends StatefulWidget {
  const AuthenScreenIntro({Key? key, required this.isSignIn}) : super(key: key);
  final bool isSignIn;
  @override
  _AuthenScreenIntroState createState() => _AuthenScreenIntroState();
}

class _AuthenScreenIntroState extends State<AuthenScreenIntro> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
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
              widget.isSignIn == true ? i18n!.signInTitle : i18n!.signUpTitle,
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
        ],
      ),
    );
  }
}
