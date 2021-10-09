import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';

class TutorListTile extends StatefulWidget {
  const TutorListTile({Key? key, required this.tutorItem}) : super(key: key);
  final Tutor tutorItem;
  @override
  _TutorListTileState createState() => _TutorListTileState();
}

class _TutorListTileState extends State<TutorListTile> {
  bool isFavorited = false;
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                child: ClipOval(
                  child: Image.network(
                    widget.tutorItem.avartarImg,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
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
                  widget.tutorItem.name,
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 20),
            child: RatingBar.builder(
              initialRating: widget.tutorItem.rating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
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
              tagsList: widget.tutorItem.specialities.toList(),
              readOnly: true,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              widget.tutorItem.summary.length < 150
                  ? widget.tutorItem.summary
                  : widget.tutorItem.summary.substring(0, 150) + "...",
            ),
          ),
          Container(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: CustomizedButton(
                      btnText: i18n!.bookTutorBtnText,
                      icon: Icons.event_available,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: CustomizedButton(
                      btnText: i18n.messageTutorBtnText,
                      icon: Icons.chat,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
