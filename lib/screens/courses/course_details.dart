import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/real_models/course.dart';
import 'package:lettutor/widgets/courses/course_list_tile.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({Key? key, required this.courseDetail}) : super(key: key);
  final Course courseDetail;
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: CourseListTile(
                readOnly: true,
                data: widget.courseDetail,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Text(
                        i18n!.courseViewOverviewLabel,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          i18n.courseViewWhyTake,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      widget.courseDetail.reason!,
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.help_outline,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          i18n.courseViewWhat,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 35),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text(
                      widget.courseDetail.purpose!,
                      style: TextStyle(fontSize: 14, height: 1.5),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      i18n.courseViewExperienceLvl,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.people_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        Text(
                          widget.courseDetail.categories!.elementAt(0).key!,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      i18n.courseViewLength,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.book_outlined,
                          color: Colors.blue,
                          size: 20,
                        ),
                        Text(
                          widget.courseDetail.topics!.length.toString() +
                              " lessons",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      i18n.courseViewTopicList,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: widget.courseDetail.topics!.length,
                      itemBuilder: (context, position) {
                        return Text(
                          (position + 1).toString() +
                              ". " +
                              widget.courseDetail.topics!
                                  .elementAt(position)
                                  .name!,
                          style: TextStyle(
                            fontSize: 16,
                            wordSpacing: 1.5,
                            height: 1.5,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
