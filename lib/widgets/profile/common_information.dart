import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CommonInformation extends StatefulWidget {
  const CommonInformation(
      {Key? key, required this.user, required this.onUpdateInfo})
      : super(key: key);
  final User user;
  final Function onUpdateInfo;
  @override
  _CommonInformationState createState() => _CommonInformationState();
}

class _CommonInformationState extends State<CommonInformation> {
  final commonInfoForm = GlobalKey<FormState>();
  bool showDatePicker = false;
  User? userData;
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  String? country;
  DateTime? birthday;
  List<String> specialties = [];
  List<String> levels = [
    "BEGINNER",
    "HIGHER_BEGINNER",
    "PRE_INTERMEDIATE",
    "INTERMEDIATE",
    "UPPER_INTERMEDIATE",
    "ADVANCED",
    "PROFICIENCY"
  ];
  String levelValue = "BEGINNER";
  @override
  void initState() {
    super.initState();
    setState(() {
      userData = widget.user;
      nameController = TextEditingController(text: userData!.name);
      emailController = TextEditingController(text: userData!.email);
      phoneController = TextEditingController(text: userData!.phone);
      country = userData!.country;
      if (userData!.birthday != null) {
        List<String> dayStr = userData!.birthday!.split("-");
        if (dayStr.length == 3) {
          int year = int.tryParse(dayStr[0]) ?? 2000;
          int month = int.tryParse(dayStr[1]) ?? 1;
          int day = int.tryParse(dayStr[2]) ?? 1;
          birthday = DateTime(year, month, day);
        }
      }
    });
  }

  Future<void> updateCommonInfo(BuildContext context) async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      // String fileName = imagePath.split('/').last;
      var data = {
        'name': nameController?.text ?? "default",
        'phone': phoneController?.text ?? "000000000",
        'country': country,
        'level': levelValue,
        'birthday': DateFormat('yyyy-MM-dd').format(birthday ?? DateTime.now()),
      };
      await dio.put('user/info', data: data);
      widget.onUpdateInfo();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Update user data failed, try again later",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Form(
      key: commonInfoForm,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n!.nameLabelText,
                ),
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.emailLabelText,
                ),
                enabled: false,
                controller: emailController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text(i18n.countryLabelText + ": "),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                      child: CountryCodePicker(
                        onChanged: (CountryCode countryCode) {
                          setState(() {
                            country = countryCode.toString();
                          });
                        },
                        initialSelection: country,
                        showOnlyCountryWhenClosed: true,
                        showCountryOnly: true,
                        alignLeft: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.phoneLabelText,
                ),
                controller: phoneController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
                enabled: userData?.isPhoneActivated == true ? false : true,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: CustomizedButton(
                btnText: birthday != null
                    ? birthday.toString()
                    : i18n.birthDayLabelText,
                onTap: () {
                  setState(() {
                    showDatePicker = true;
                  });
                },
              ),
            ),
            if (showDatePicker == true)
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: SfDateRangePicker(
                  showTodayButton: true,
                  view: DateRangePickerView.month,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    setState(() {
                      birthday = args.value;
                      showDatePicker = false;
                    });
                  },
                  onCancel: () {
                    setState(() {
                      showDatePicker = false;
                    });
                  },
                ),
              ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                i18n.levelLabelText + ": ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black38,
                  width: 1,
                ),
              ),
              child: DropdownButton(
                isExpanded: true,
                underline: SizedBox(),
                items: levels.map<DropdownMenuItem>((String selectedValue) {
                  return DropdownMenuItem(
                    child: Text(selectedValue),
                    value: selectedValue,
                  );
                }).toList(),
                value: levelValue,
                onChanged: (dynamic newValue) {
                  print(newValue.toString());
                  setState(() {
                    levelValue = newValue;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 150,
                  child: SubmitButton(
                    btnText: i18n.saveChangesBtnText,
                    onTap: () {
                      if (commonInfoForm.currentState!.validate()) {
                        updateCommonInfo(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
