import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/auth.dart';
import 'package:lettutor/screens/reset_password.dart';
import 'package:lettutor/screens/sign_up.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';
import 'package:lettutor/widgets/common/header/no_drawer_header.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _showPassword = false;
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: 'teacher@lettutor.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  Future<Auth?> login() async {
    try {
      var body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var dio = Http().client;
      var res = await dio.post(
        'auth/login',
        data: body,
      );
      var auth = Auth.fromJson(res.data);
      inspect(auth);
      return auth;
    } catch (e) {
      inspect(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Form(
      key: _signInFormKey,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  labelText: i18n!.emailLabel,
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
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
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
                  InkWell(
                    child: Container(
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BoilerPlate(
                            page: SignUpPage(),
                          ),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BoilerPlate(
                            page: ResetPasswordPage(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: Consumer<AuthProvider>(
                builder: (context, value, child) {
                  return SubmitButton(
                    btnText: i18n.loginTextBtn,
                    onTap: () async {
                      if (_signInFormKey.currentState!.validate()) {
                        Auth? result = await login();
                        if (result != null) {
                          value.setAuth(result);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BoilerPlate(
                                page: NoDrawerHeader(),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
