import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/tutor_dto.dart';
import 'package:lettutor/screens/tutors/details.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';

class TutorListTile extends StatefulWidget {
  const TutorListTile({Key? key, required this.tutorData}) : super(key: key);
  final TutorDTO tutorData;
  @override
  _TutorListTileState createState() => _TutorListTileState();
}

class _TutorListTileState extends State<TutorListTile> {
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

  double getTotalRating() {
    double result = 0;
    for (var i = 0; i < widget.tutorData.feedbacks!.length; i++) {
      result = result + widget.tutorData.feedbacks!.elementAt(i).rating!;
    }

    return result / widget.tutorData.feedbacks!.length;
  }

  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        displayDialog(
          context,
          "",
          TutorDetails(
            tutor: widget.tutorData,
          ),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      widget.tutorData.avatar!,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Colors.red : Colors.blue,
                        size: 26,
                      ),
                      onTap: () {
                        setState(() {
                          isFavorited = !isFavorited;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    widget.tutorData.name ?? "default",
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              transform: Matrix4.translationValues(-15, 0, 0),
              child: CountryCodePicker(
                alignLeft: true,
                initialSelection: widget.tutorData.country,
                showOnlyCountryWhenClosed: true,
                enabled: false,
                padding: EdgeInsets.all(0),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: RatingBar.builder(
                initialRating:
                    this.getTotalRating().isNaN ? 0 : this.getTotalRating(),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
                ignoreGestures: true,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: TagsList(
                tagsList: widget.tutorData.specialties!.split(",").toList(),
                selectFirstItem: false,
                readOnly: true,
                isHorizontal: true,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.tutorData.bio ?? "default",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(left: 10),
            //         child: CustomizedButton(
            //           btnText: i18n!.bookTutorBtnText,
            //           icon: Icons.event_available,
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: 10),
            //         child: CustomizedButton(
            //           btnText: i18n.messageTutorBtnText,
            //           icon: Icons.chat,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
