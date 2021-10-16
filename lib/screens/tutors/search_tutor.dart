import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';

class SearchTutorPage extends StatefulWidget {
  const SearchTutorPage({Key? key}) : super(key: key);

  @override
  _SearchTutorPageState createState() => _SearchTutorPageState();
}

class _SearchTutorPageState extends State<SearchTutorPage> {
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: i18n.searchTutorPlaceholder,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TagsList(
                tagsList: tagsList,
                isHorizontal: true,
                selectFirstItem: true,
              ),
              padding: EdgeInsets.only(bottom: 10),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                children: [
                  Text(i18n.searchNationality + ": "),
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
                          print(
                            "New Country selected: " + countryCode.toString(),
                          );
                        },
                        initialSelection: 'VN',
                        showOnlyCountryWhenClosed: true,
                        showCountryOnly: true,
                        padding: EdgeInsets.all(0),
                        alignLeft: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                child: Column(
                  children: [
                    TutorsList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
