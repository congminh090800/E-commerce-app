import 'package:email_validator/email_validator.dart';
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
  var _resetPassKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
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
                onTap: () {
                  if (_resetPassKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${emailController.text}"),
                      ),
                    );
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
