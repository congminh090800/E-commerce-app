import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CommonInformation extends StatefulWidget {
  const CommonInformation({Key? key}) : super(key: key);

  @override
  _CommonInformationState createState() => _CommonInformationState();
}

class _CommonInformationState extends State<CommonInformation> {
  bool showDatePicker = false;
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
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
    return Container(
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
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: i18n.nameLabelText,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: i18n.emailLabelText,
              ),
              enabled: false,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: [
                Text(i18n.countryLabelText + ": "),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: CountryCodePicker(
                    onChanged: (CountryCode countryCode) {
                      print(
                        "New Country selected: " + countryCode.toString(),
                      );
                    },
                    initialSelection: 'VN',
                    showOnlyCountryWhenClosed: true,
                    showCountryOnly: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: i18n.phoneLabelText,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: CustomizedButton(
              btnText: i18n.birthDayLabelText,
              onTap: () {
                setState(() {
                  showDatePicker = true;
                });
              },
            ),
          ),
          if (showDatePicker == true)
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: SfDateRangePicker(
                showTodayButton: true,
                view: DateRangePickerView.month,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  setState(() {
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
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.centerLeft,
            child: Text(
              i18n.levelLabelText + ": ",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: DropdownButton(
              isExpanded: true,
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
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10, top: 10),
                  child: Text(
                    i18n.wantToLearnLabelText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                TagsList(
                  tagsList: tagsList,
                  selectFirstItem: false,
                ),
              ],
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
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
