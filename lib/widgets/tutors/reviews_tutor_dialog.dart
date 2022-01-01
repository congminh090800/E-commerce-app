import 'package:flutter/material.dart';
import 'package:lettutor/real_models/feedback.dart' as feedbackModel;
import 'package:lettutor/widgets/tutors/review_list_tile.dart';

class ReviewsTutorDialog extends StatefulWidget {
  const ReviewsTutorDialog({Key? key, this.feedbacks = const []})
      : super(key: key);
  final List<feedbackModel.Feedback>? feedbacks;
  @override
  _ReviewsTutorDialogState createState() => _ReviewsTutorDialogState();
}

class _ReviewsTutorDialogState extends State<ReviewsTutorDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ListView(
        padding: EdgeInsets.only(top: 0),
        children:
            widget.feedbacks!.map((e) => ReviewListTile(data: e)).toList(),
      ),
    );
  }
}
