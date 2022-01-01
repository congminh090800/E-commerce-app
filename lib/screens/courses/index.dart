import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/models/course_dto.dart';
import 'package:lettutor/widgets/courses/course_list_tile.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<CourseDTO> courses = [];
  var sortValue;
  @override
  void initState() {
    super.initState();
    this.loadJsonData();
  }

  Future<void> loadJsonData() async {
    var jsonText = await rootBundle.loadString("assets/course_dummy.json");
    Iterable i = jsonDecode(jsonText);
    List<CourseDTO>? result =
        List<CourseDTO>.from(i.map((course) => CourseDTO.fromJson(course)));
    setState(() {
      courses = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    var categoriesTags = [
      "business-english",
      "conversational-english",
      "english-for-kids",
      "ielts",
      "toeic",
      "starters",
      "movers",
      "flyers",
      "ket",
      "pet",
      "toefl"
    ];
    var levelsTag = [
      i18n!.allType,
      i18n.levelBeginner,
      i18n.levelHigherBeginner,
      i18n.levelPreInter,
      i18n.levelInter,
      i18n.levelUpperInter,
      i18n.levelAdvanced,
      i18n.levelProficiency
    ];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/course_view_icon.svg',
                            width: 120,
                            height: 120,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: VerticalDivider(
                        thickness: 5,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Text(
                              i18n.courseViewTitle,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              i18n.courseViewDescription,
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                                color: Color(0xff787878),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                  hintText: i18n.courseViewSearchPlaceholder,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TagsList(
                tagsList: categoriesTags,
                isHorizontal: true,
              ),
              padding: EdgeInsets.only(bottom: 10),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TagsList(
                tagsList: levelsTag,
                isHorizontal: true,
                selectFirstItem: true,
              ),
              padding: EdgeInsets.only(bottom: 10),
            ),
            Container(
              alignment: Alignment.centerLeft,
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
                icon: Icon(
                  Icons.keyboard_arrow_down,
                ),
                isExpanded: true,
                underline: SizedBox(),
                items: [i18n.courseViewLevelAsc, i18n.courseViewLevelDesc]
                    .map<DropdownMenuItem>((String selectedValue) {
                  return DropdownMenuItem(
                    child: Text(selectedValue),
                    value: selectedValue,
                  );
                }).toList(),
                hint: Text(i18n.courseViewSortByLevel),
                value: sortValue,
                onChanged: (dynamic newValue) {
                  setState(() {
                    sortValue = newValue.toString();
                  });
                },
              ),
            ),
            ListView(
              primary: false,
              shrinkWrap: true,
              children: courses
                  .map((e) => CourseListTile(
                        data: e,
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
