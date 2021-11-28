import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/user_dto.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CommonInformation extends StatefulWidget {
  const CommonInformation({Key? key, required this.user}) : super(key: key);
  final UserDTO user;
  @override
  _CommonInformationState createState() => _CommonInformationState();
}

class _CommonInformationState extends State<CommonInformation> {
  final commonInfoForm = GlobalKey<FormState>();
  bool showDatePicker = false;
  UserDTO? userData;
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  String? country;
  DateTime? birthday;
  List<String> specialties = [];
  @override
  void initState() {
    super.initState();
    setState(() {
      userData = widget.user;
      nameController = TextEditingController(text: userData!.name);
      emailController = TextEditingController(text: userData!.email);
      phoneController = TextEditingController(text: userData!.phone);
      country = userData!.country;
      birthday = DateTime.parse(userData!.birthday ?? "2000-01-01");
    });
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    print(birthday);
    var tagsList = [
      i18n!.engForKidsType,
      i18n.engForBusinessType,
      i18n.conversationalType,
      i18n.startersType,
      i18n.moversType,
      i18n.flytersType,
      i18n.ketType,
      i18n.petType,
      i18n.ieltsType,
      i18n.toeflType,
      i18n.toeicType
    ];
    List<String> levels = [
      i18n.levelBeginner,
      i18n.levelHigherBeginner,
      i18n.levelPreInter,
      i18n.levelInter,
      i18n.levelUpperInter,
      i18n.levelAdvanced,
      i18n.levelProficiency
    ];
    String levelValue = i18n.levelBeginner;
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
                  hintText: i18n.nameLabelText,
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
            Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                i18n.wantToLearnLabelText,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              child: TagsList(
                tagsList: tagsList,
                selectFirstItem: false,
                onSelectedList: (list) {
                  setState(() {
                    specialties = list;
                  });
                  print(specialties);
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Saved"),
                          ),
                        );
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
