import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/header/index.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';

class TutorsPage extends StatefulWidget {
  const TutorsPage({Key? key}) : super(key: key);

  @override
  _TutorsPageState createState() => _TutorsPageState();
}

class _TutorsPageState extends State<TutorsPage> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    var tagsList = [
      i18n!.allType,
      i18n.engForKidsType,
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
    return Header(
      screen: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  i18n.tutorPageTitle,
                  style: TextStyle(
                    fontSize: 29,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: TagsList(tagsList: tagsList),
                padding: EdgeInsets.only(bottom: 30),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: i18n.searchTutorPlaceholder,
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Text(i18n.searchNationality + ": "),
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
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 20),
                      child: SubmitButton(btnText: i18n.searchTutorSubmit),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black54,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(bottom: 20),
                child: TutorsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
