import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BecomeTutorPage extends StatefulWidget {
  const BecomeTutorPage({Key? key}) : super(key: key);

  @override
  _BecomeTutorPageState createState() => _BecomeTutorPageState();
}

enum Level { Beginner, Intermediate, Advanced }

class _BecomeTutorPageState extends State<BecomeTutorPage> {
  int _currentStep = 0;
  bool showDatePicker = false;
  Level? _level = Level.Beginner;
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
    List<Step> getSteps() => [
          Step(
            isActive: _currentStep >= 0,
            title: Text(
              i18n.profileTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.5),
                    child: Text(
                      i18n.profileStepTitle,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.5),
                    child: Text(
                      i18n.profileStepDescription1,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      i18n.profileStepDescription2,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.5),
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.red,
                        ),
                        Text(
                          i18n.profileStepBasicInfoSection,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        CustomizedButton(
                          btnText: i18n.profileStepUploadHint,
                          icon: Icons.image,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepTutorNameField,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: [
                              Text(i18n.profileStepNationalityField + ": "),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                ),
                                child: CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    print(
                                      "New Country selected: " +
                                          countryCode.toString(),
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
                          padding: EdgeInsets.only(bottom: 20),
                          child: CustomizedButton(
                            btnText: i18n.profileStepBirthdayField,
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
                              onSelectionChanged:
                                  (DateRangePickerSelectionChangedArgs args) {
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
                        Divider(
                          color: Colors.red,
                        ),
                        Text(
                          i18n.profileStepCVSection,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          i18n.profileStepCVDescription,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepInterestsField,
                              hintText: i18n.profileStepInterestsPlaceholder,
                              hintMaxLines: 10,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepEducationField,
                              hintText: i18n.profileStepEducationPlaceholder,
                              hintMaxLines: 10,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepExperienceField,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepProfession,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.red,
                        ),
                        Text(
                          i18n.profileStepLangSection,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 20, top: 20),
                          child: Row(
                            children: [
                              Text(i18n.profileStepLanguagesField + ": "),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                ),
                                child: CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    print(
                                      "New Country selected: " +
                                          countryCode.toString(),
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
                        Divider(
                          color: Colors.red,
                        ),
                        Text(
                          i18n.profileStepTargetSection,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: i18n.profileStepIntroductionField,
                              hintText: i18n.profileStepIntroductionPlaceholder,
                              hintMaxLines: 10,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          alignment: Alignment.centerLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                i18n.profileStepBestAtTeachingField,
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 16),
                              ),
                              ListTile(
                                title: Text(i18n
                                    .profileStepBestAtTeachingBeginnerOption),
                                leading: Radio<Level>(
                                  value: Level.Beginner,
                                  groupValue: _level,
                                  onChanged: (Level? value) {
                                    setState(() {
                                      _level = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(i18n
                                    .profileStepBestAtTeachingIntermediateOption),
                                leading: Radio<Level>(
                                  value: Level.Intermediate,
                                  groupValue: _level,
                                  onChanged: (Level? value) {
                                    setState(() {
                                      _level = value;
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: Text(i18n
                                    .profileStepBestAtTeachingAdvancedOption),
                                leading: Radio<Level>(
                                  value: Level.Advanced,
                                  groupValue: _level,
                                  onChanged: (Level? value) {
                                    setState(() {
                                      _level = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Text(
                                i18n.profileStepSpecialtiesField,
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              TagsList(
                                tagsList: tagsList,
                                readOnly: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: _currentStep >= 1,
            title: Text(
              i18n.videoIntroTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10.5),
                    child: Text(
                      i18n.videoStepTitle,
                      style:
                          TextStyle(fontSize: 21, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.5),
                    child: Text(
                      i18n.videoStepDescription,
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  Text(
                    i18n.videoStepIntroSection,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomizedButton(
                    btnText: i18n.videoStepChooseBtnText,
                    icon: Icons.image,
                  ),
                ],
              ),
            ),
          ),
          Step(
            isActive: _currentStep >= 2,
            title: Text(
              i18n.approvalTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      i18n.approvalStepNotification,
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ];
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 30),
      child: Stepper(
        type: StepperType.vertical,
        steps: getSteps(),
        currentStep: _currentStep,
        onStepContinue: () {
          bool isLastStep = _currentStep == getSteps().length - 1;
          if (isLastStep) {
            print('finished');
          } else {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        controlsBuilder: (context, {onStepCancel, onStepContinue}) {
          return Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(i18n.tutorRegisterBackBtnText),
                    onPressed: onStepCancel,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: ElevatedButton(
                    child: Text(_currentStep == getSteps().length - 1
                        ? i18n.approvalStepBackBtnText
                        : i18n.tutorRegisterNextBtnText),
                    onPressed: onStepContinue,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
