import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/real_models/feedback.dart' as feedbackModel;
import 'package:timeago/timeago.dart' as timeago;

class ReviewListTile extends StatefulWidget {
  const ReviewListTile({Key? key, required this.data}) : super(key: key);
  final feedbackModel.Feedback data;
  @override
  _ReviewListTileState createState() => _ReviewListTileState();
}

class _ReviewListTileState extends State<ReviewListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.data.firstInfo!.avatar ?? "",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          widget.data.firstInfo!.name ?? "default",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Text(
                          timeago.format(widget.data.createdAt!),
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: RatingBar.builder(
                      initialRating: widget.data.rating!.toDouble(),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 10,
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
                    child: Text(
                      widget.data.content ?? "",
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
