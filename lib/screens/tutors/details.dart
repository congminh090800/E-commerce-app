import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/models/tutor_dto.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/book_calendar_dialog.dart';
import 'package:lettutor/widgets/tutors/message_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/report_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/reviews_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/twolines_button.dart';

class TutorDetails extends StatefulWidget {
  const TutorDetails({Key? key, required this.tutor}) : super(key: key);
  final TutorDTO tutor;
  @override
  _TutorDetailsState createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
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
    for (var i = 0; i < widget.tutor.feedbacks!.length; i++) {
      result = result + widget.tutor.feedbacks!.elementAt(i).rating!;
    }

    return result / widget.tutor.feedbacks!.length;
  }

  bool _isFavorited = false;
  bool _showFullSummary = false;
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.centerLeft,
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage: NetworkImage(
                                  widget.tutor.avatar ?? "",
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                widget.tutor.name ?? "default",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              padding: EdgeInsets.only(left: 16),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: CountryCodePicker(
                                alignLeft: true,
                                initialSelection: widget.tutor.country ?? "VN",
                                showOnlyCountryWhenClosed: true,
                                enabled: false,
                                textStyle: TextStyle(
                                  fontSize: 20,
                                ),
                                padding: EdgeInsets.all(0),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              alignment: Alignment.centerLeft,
                              child: RatingBar.builder(
                                initialRating: getTotalRating().isNaN
                                    ? 0
                                    : getTotalRating(),
                                minRating: 0,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemSize: 20,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.tutor.bio ?? "default",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff787878),
                      ),
                      maxLines: _showFullSummary == false ? 4 : null,
                    ),
                  ),
                  InkWell(
                    child: Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Text(
                        _showFullSummary == false
                            ? i18n!.showMoreText
                            : i18n!.showLessText,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _showFullSummary = !_showFullSummary;
                      });
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TwoLinesButton(
                                btnText: i18n.messageBtnText,
                                icon: Icons.chat_outlined,
                                textSize: 18,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.messageBtnText,
                                    MessageTutorDialog(),
                                  ),
                                },
                              ),
                              TwoLinesButton(
                                btnText: i18n.favoriteBtnText,
                                icon: _isFavorited == true
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                textSize: 18,
                                onTap: () {
                                  setState(() {
                                    _isFavorited = !_isFavorited;
                                  });
                                },
                              ),
                              TwoLinesButton(
                                btnText: i18n.reportBtnText,
                                icon: Icons.report_gmailerrorred,
                                textSize: 18,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.reportBtnText +
                                        " " +
                                        (widget.tutor.name ?? ""),
                                    ReportTutorDialog(),
                                  ),
                                },
                              ),
                              TwoLinesButton(
                                btnText: i18n.reviewsBtnText,
                                icon: Icons.star_border,
                                textSize: 18,
                                onTap: () => {
                                  displayDialog(
                                    context,
                                    i18n.reviewsBtnText,
                                    ReviewsTutorDialog(
                                      feedbacks: widget.tutor.feedbacks,
                                    ),
                                  ),
                                },
                              ),
                            ],
                          ),
                          scrollDirection: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: CustomizedButton(
                      btnText: i18n.bookTutorBtnText,
                      background: Colors.blue,
                      primaryColor: Colors.white,
                      onTap: () => {
                        displayDialog(context, i18n.bookTutorBtnText,
                            BookCalendarDialog())
                      },
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      i18n.profileStepSpecialtiesField,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TagsList(
                      tagsList: widget.tutor.specialties!.split(",").toList(),
                      selectFirstItem: false,
                      readOnly: true,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      i18n.profileStepLanguagesField,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(bottom: 20),
                    child: TagsList(
                      tagsList: widget.tutor.languages!.split(",").toList(),
                      selectFirstItem: false,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                i18n.profileStepInterestsField,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.tutor.interests ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                i18n.profileStepExperienceField,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.tutor.experience ?? "",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black26,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* DUMMY  */
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
/*DUMMY DATA */
