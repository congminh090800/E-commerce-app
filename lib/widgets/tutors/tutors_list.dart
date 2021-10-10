import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/widgets/tutors/tutor_list_tile.dart';

class TutorsList extends StatefulWidget {
  const TutorsList({Key? key}) : super(key: key);

  @override
  _TutorsListState createState() => _TutorsListState();
}

class _TutorsListState extends State<TutorsList> {
  Tutor dummy = Tutor(
    "1",
    "Jill Leano",
    3.0,
    "Hi, My name is Jill I am an experienced English Teacher from Philippine. I would like share my enthusiasm with the learners in this platform. I've been working with diverse learners of all levels for many years. I am greatly passionate about about profession. I love teaching because I can help others improve their skills and it gives me joy and excitement meeting different learners around the world. In my class I worked with wonderful enthusiasm and positivity, and I'm happy t focus on my learner's goal.",
    ["English for kids", "English for business", "Conversational", "STARTERS"],
    "https://api.app.lettutor.com/avatar/e9e3eeaa-a588-47c4-b4d1-ecfa190f63faavatar1632109929661.jpg",
    "VN",
    ["English"],
    "Finance, gardening, travelling",
    "5 years of English teaching experience ",
  );

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              i18n!.recommendedTutors,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 25,
                color: Color(0xff3c3c3c),
              ),
            ),
          ),
          Container(
            child: ListView(
              shrinkWrap: true,
              primary: false,
              children: [
                Container(
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: 20),
                    child: TutorListTile(tutorItem: dummy),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: 20),
                    child: TutorListTile(tutorItem: dummy),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                Container(
                  child: Card(
                    elevation: 3,
                    margin: EdgeInsets.only(top: 20),
                    child: TutorListTile(tutorItem: dummy),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
