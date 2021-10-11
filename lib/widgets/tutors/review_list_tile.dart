import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/review.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewListTile extends StatefulWidget {
  const ReviewListTile({Key? key}) : super(key: key);

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
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              margin: EdgeInsets.only(
                left: 10,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text(
                          "Khanh Uyen",
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
                          timeago.format(dummyReview.createdAt),
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
                      initialRating: dummyReview.rating,
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
                      dummyReview.comment,
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

var dummyReview = Review(
  "1",
  5.0,
  "1",
  "Ms April is funnn",
  DateTime.now(),
);
