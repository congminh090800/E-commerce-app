import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/widgets/tutors/tutor_list_tile.dart';

class TutorsList extends StatefulWidget {
  const TutorsList({Key? key, required this.tutors}) : super(key: key);
  final List<Tutor> tutors;
  @override
  _TutorsListState createState() => _TutorsListState();
}

class _TutorsListState extends State<TutorsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        shrinkWrap: true,
        primary: false,
        children: widget.tutors
            .map((tutor) => Container(
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: 20),
                    child: TutorListTile(
                      tutor: tutor,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
