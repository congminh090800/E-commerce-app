import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThirdPartySignIn extends StatefulWidget {
  const ThirdPartySignIn({Key? key}) : super(key: key);

  @override
  _ThirdPartySignInState createState() => _ThirdPartySignInState();
}

class _ThirdPartySignInState extends State<ThirdPartySignIn> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: Text(
              i18n!.orContinueWith,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50, left: 100, right: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/images/facebook_icon.svg',
                    width: 40, height: 40),
                SvgPicture.asset('assets/images/google_icon.svg',
                    width: 40, height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
