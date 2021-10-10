import 'package:flutter/material.dart';
import 'package:lettutor/widgets/tutors/review_list_tile.dart';

class ReviewsTutorDialog extends StatefulWidget {
  const ReviewsTutorDialog({Key? key}) : super(key: key);

  @override
  _ReviewsTutorDialogState createState() => _ReviewsTutorDialogState();
}

class _ReviewsTutorDialogState extends State<ReviewsTutorDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          ReviewListTile(),
          ReviewListTile(),
          ReviewListTile(),
        ],
      ),
    );
  }
}
