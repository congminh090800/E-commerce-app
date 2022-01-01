import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/screens/sign_in.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';
import 'package:lettutor/widgets/common/header/index.dart';
import 'package:lettutor/widgets/common/submit_button.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  var _resetPassKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  Future<bool> sendReset() async {
    try {
      var body = {
        'email': emailController.text,
      };
      var dio = Http().client;
      var res = await dio.post(
        'user/forgotPassword',
        data: body,
      );
      inspect(res);
      return true;
    } catch (e) {
      inspect(e);
      print("Error in reset password");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Header(
      screen: Form(
        key: _resetPassKey,
        child: Container(
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
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(width: 1),
                    ),
                    labelText: i18n.emailLabel,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required";
                    } else if (!EmailValidator.validate(value)) {
                      return "Not a valid email";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SubmitButton(
                btnText: i18n.sendResetLinkBtnText,
                onTap: () async {
                  if (_resetPassKey.currentState!.validate()) {
                    bool result = await sendReset();
                    if (result == true) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BoilerPlate(
                            page: SignInPage(),
                          ),
                        ),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
