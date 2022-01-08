import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/category.dart';
import 'package:lettutor/real_models/course.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/courses/course_list_tile.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:provider/provider.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  var i18n;
  int page = 1;
  int size = 2;
  int count = 0;
  List<String> levelsTag = [];
  var sortValue;
  List<int> selectedLevels = [];
  List<Category> categories = [];
  List<String> categoriesTags = [];
  List<String> selectedCategories = [];
  TextEditingController qController = TextEditingController();
  List<Course> courseList = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      setState(() {
        i18n = AppLocalizations.of(context);
        levelsTag = [
          i18n!.allType,
          i18n.levelBeginner,
          i18n.levelHigherBeginner,
          i18n.levelPreInter,
          i18n.levelInter,
          i18n.levelUpperInter,
          i18n.levelPreAdvanced,
          i18n.levelAdvanced,
          i18n.levelProficiency
        ];
      });
      await getCategories();
      await getCourseList(true);
    });
  }

  List<int> convertLevelToIndex(List<String> levels) {
    List<int> result = [];
    for (int i = 0; i < levels.length; i++) {
      int index = levelsTag.indexWhere((element) => element == levels[i]);
      if (index >= 0) {
        result.add(index);
      }
    }
    return result;
  }

  List<String> convertCategoriesToId(List<String> temp) {
    List<String> result = [];
    for (int i = 0; i < temp.length; i++) {
      int index = categories.indexWhere((element) => element.title == temp[i]);
      if (index >= 0 && categories[index].id != null) {
        result.add(categories[index].id ?? "");
      }
    }
    return result;
  }

  Future<void> getCourseList(bool resetList) async {
    try {
      setState(() {
        if (resetList == true) {
          courseList.clear();
          page = 1;
        }
        loading = true;
      });
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var query = {
        'page': page,
        'size': size,
        'level': selectedLevels,
        'categoryId': selectedCategories,
        'q': qController.text
      };
      var res = await dio.get("course", queryParameters: query);
      Iterable i = res.data["data"]["rows"];
      List<Course> data =
          List<Course>.from(i.map((course) => Course.fromJson(course)));
      setState(() {
        courseList.addAll(data);
        count = res.data["data"]["count"];
        loading = false;
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> getCategories() async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.get(
        "content-category",
      );
      Iterable i = res.data["rows"];
      List<Category> result =
          List<Category>.from(i.map((category) => Category.fromJson(category)));
      setState(() {
        categories = result;
        categoriesTags = result.map((ele) => ele.title ?? "").toList();
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return i18n == null
        ? Container()
        : SingleChildScrollView(
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
                    child: Row(
                      children: [
                        Expanded(
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
                            controller: qController,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        CustomizedButton(
                          btnText: 'Search',
                          borderRadius: 0,
                          onTap: () async {
                            await getCourseList(true);
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TagsList(
                      tagsList: categoriesTags,
                      isHorizontal: true,
                      onSelectedList: (p0) async {
                        setState(() {
                          selectedCategories = convertCategoriesToId(p0);
                        });
                        await getCourseList(true);
                      },
                    ),
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: TagsList(
                      tagsList: levelsTag,
                      isHorizontal: true,
                      onSelectedList: (p0) async {
                        setState(() {
                          selectedLevels = convertLevelToIndex(p0);
                        });
                        await getCourseList(true);
                      },
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
                      items: ["Level Ascending", "Level Descreasing"]
                          .map<DropdownMenuItem>((String selectedValue) {
                        return DropdownMenuItem(
                          child: Text(selectedValue),
                          value: selectedValue,
                        );
                      }).toList(),
                      hint: Text(i18n.courseViewSortByLevel),
                      value: sortValue,
                      onChanged: (dynamic newValue) async {
                        setState(() {
                          sortValue = newValue.toString();
                        });
                        await getCourseList(true);
                      },
                    ),
                  ),
                  courseList.length > 0
                      ? ListView(
                          primary: false,
                          shrinkWrap: true,
                          children: courseList
                              .map((e) => CourseListTile(
                                    data: e,
                                  ))
                              .toList(),
                        )
                      : loading == true
                          ? Container()
                          : Container(
                              child: Text(
                                "No data",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(top: 20),
                            ),
                  size * page < count && loading == false
                      ? Container(
                          child: CustomizedButton(
                            btnText: "Load more",
                            onTap: () async {
                              setState(() {
                                page = page + 1;
                              });
                              await getCourseList(false);
                            },
                            hasBorder: false,
                            textSize: 20,
                          ),
                          margin: EdgeInsets.only(
                            top: 16,
                            bottom: 4,
                          ),
                        )
                      : Container(),
                  loading == true
                      ? Container(
                          child: CircularProgressIndicator(),
                          padding: EdgeInsets.only(top: 20),
                        )
                      : Container(),
                ],
              ),
            ),
          );
  }
}
