import 'package:flutter/material.dart';
import 'package:lettutor/screens/courses/course_details.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';

class CourseListTile extends StatefulWidget {
  const CourseListTile({Key? key, this.readOnly = false}) : super(key: key);
  final bool readOnly;
  @override
  _CourseListTileState createState() => _CourseListTileState();
}

class _CourseListTileState extends State<CourseListTile> {
  displayDialog(BuildContext context, String title, Widget content) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            FullScreenDialog(title: title, content: content),
        fullscreenDialog: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.readOnly == false) {
          displayDialog(context, "", CourseDetails());
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 4,
          child: Column(
            children: [
              Image.network(
                "https://camblycurriculumicons.s3.amazonaws.com/5e2b895e541a832674533c18?h=d41d8cd98f00b204e9800998ecf8427e",
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New Basic Conversation Topics",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Gain confidence speaking about familiar topics",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(128, 128, 128, 1),
                      ),
                      textAlign: TextAlign.left,
                    ),
                    if (widget.readOnly == false)
                      SizedBox(
                        height: 24,
                      ),
                    if (widget.readOnly == false)
                      Text(
                        "Beginner - 0 lessons",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black.withOpacity(0.85)),
                        textAlign: TextAlign.left,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
