import 'package:flutter/material.dart';
import 'package:lettutor/models/course_dto.dart';
import 'package:lettutor/screens/courses/course_details.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';

class CourseListTile extends StatefulWidget {
  const CourseListTile({Key? key, this.readOnly = false, this.data})
      : super(key: key);
  final bool readOnly;
  final CourseDTO? data;
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
          displayDialog(
              context,
              "",
              CourseDetails(
                courseDetail: widget.data!,
              ));
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
                widget.data!.imageUrl!,
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
                      widget.data!.name!,
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
                      widget.data!.description!,
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
                        widget.data!.categories!.elementAt(0).key! +
                            " - " +
                            widget.data!.topics!.length.toString() +
                            " lesson(s)",
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
