import 'dart:developer';

import "package:email_validator/email_validator.dart";
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/screens/sign_in.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';
import 'package:lettutor/widgets/common/submit_button.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _showPassword = false;
  final _signUpFormKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<bool> signUp() async {
    try {
      var body = {
        'email': emailController.text,
        'password': passwordController.text,
      };
      var dio = Http().client;
      var res = await dio.post(
        'auth/register',
        data: body,
      );
      inspect(res);
      return true;
    } catch (e) {
      inspect(e);
      print("Error in sign up");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      alignment: Alignment.center,
      child: Form(
        key: _signUpFormKey,
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.only(bottom: 24),
            //   child: TextFormField(
            //     controller: nameController,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //         borderSide: BorderSide(width: 1),
            //       ),
            //       labelText: i18n!.nameLabelText.toUpperCase(),
            //     ),
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return "Required";
            //       } else {
            //         return null;
            //       }
            //     },
            //   ),
            // ),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  labelText: i18n.comfirmPasswordLabel.toUpperCase(),
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  } else if (value != passwordController.text) {
                    return "Input not match with current password";
                  } else {
                    return null;
                  }
                },
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            i18n.alreadyHaveAnAcount,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            i18n.signInLink,
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
                            page: SignInPage(),
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
              child: SubmitButton(
                btnText: i18n.signUpTextBtn,
                onTap: () async {
                  if (_signUpFormKey.currentState!.validate()) {
                    bool result = await signUp();
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
            )
          ],
        ),
      ),
    );
  }
}
