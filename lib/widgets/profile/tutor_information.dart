import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';

class TutorInformation extends StatefulWidget {
  const TutorInformation({Key? key}) : super(key: key);

  @override
  _TutorInformationState createState() => _TutorInformationState();
}

enum Level { Beginner, Intermediate, Advanced }

class _TutorInformationState extends State<TutorInformation> {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  i18n.profileStepBestAtTeachingField,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16),
                ),
                ListTile(
                  title: Text(i18n.profileStepBestAtTeachingBeginnerOption),
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
                  title: Text(i18n.profileStepBestAtTeachingIntermediateOption),
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
                  title: Text(i18n.profileStepBestAtTeachingAdvancedOption),
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
            alignment: Alignment.centerLeft,
            child: Text(
              i18n.profileStepSpecialtiesField,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          TagsList(
            tagsList: tagsList,
            selectFirstItem: false,
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
