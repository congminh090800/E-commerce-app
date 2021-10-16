import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/header/index.dart';
import 'package:lettutor/widgets/common/submit_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Header(
      screen: Container(
        padding: EdgeInsets.fromLTRB(35, 35, 35, 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                i18n!.resetPasswordTitle,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                i18n.resetPasswordDescription,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  labelText: i18n.emailLabel,
                ),
              ),
            ),
            SubmitButton(btnText: i18n.sendResetLinkBtnText),
          ],
        ),
      ),
    );
  }
}
