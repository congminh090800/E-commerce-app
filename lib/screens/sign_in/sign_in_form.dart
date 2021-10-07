import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: i18n!.emailLabel,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: i18n.passwordLabel,
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  child: Icon(
                    _showPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
              ),
              obscureText: !_showPassword,
              enableSuggestions: false,
              autocorrect: false,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        i18n.notAMemberLabel,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        i18n.signUpLink,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff2862d2),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        i18n.forgotPasswordLink,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff2862d2),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 24),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff0071f0),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    i18n.loginTextBtn,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
