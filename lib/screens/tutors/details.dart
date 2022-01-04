import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/book_calendar_dialog.dart';
import 'package:lettutor/widgets/tutors/message_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/report_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/reviews_tutor_dialog.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/twolines_button.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorDetails extends StatefulWidget {
  const TutorDetails({Key? key, required this.tutorId}) : super(key: key);
  final String tutorId;
  @override
  _TutorDetailsState createState() => _TutorDetailsState();
}

class _TutorDetailsState extends State<TutorDetails> {
  Tutor tutor = new Tutor();
  displayDialog(BuildContext context, String title, Widget content) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) =>
            FullScreenDialog(title: title, content: content),
        fullscreenDialog: true,
      ),
    ).then((value) {
      getDetail();
    });
  }

  bool _isFavorited = false;
  bool _showFullSummary = false;
  VideoPlayerController? videoController;
  Future<void>? initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();
    getDetail();
    if (tutor.video != null) {
      videoController = VideoPlayerController.network(
        tutor.video!,
      );
      initializeVideoPlayerFuture = videoController!.initialize();
      videoController!.setLooping(true);
      videoController!.play();
    }
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  void getDetail() {
    try {
      print("tutorId: ${widget.tutorId}");
      var dio = Http().client;
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        var accessToken = Provider.of<AuthProvider>(context, listen: false)
            .auth
            .tokens!
            .access!
            .token;
        dio.options.headers["Authorization"] = "Bearer $accessToken";
        var res = await dio.get(
          "tutor/${widget.tutorId}",
        );
        Tutor data = Tutor.fromJson(res.data);
        setState(() {
          tutor = data;
          _isFavorited = data.isFavorite ?? false;
        });
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> switchFavorite(BuildContext context) async {
    try {
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      var dio = Http().client;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      var res = await dio.post(
        "user/manageFavoriteTutor",
        data: {'tutorId': tutor.user == null ? tutor.userId : tutor.user!.id},
      );
      inspect(res);
      setState(() {
        _isFavorited = !_isFavorited;
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    inspect(tutor);
    return SingleChildScrollView(
      child: tutor.id != null
          ? Container(
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
                                        tutor.user != null
                                            ? tutor.user!.avatar!
                                            : (tutor.avatar ?? ""),
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
                                      tutor.user != null
                                          ? tutor.user!.name!
                                          : (tutor.name ?? ""),
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
                                      initialSelection: tutor.user != null
                                          ? tutor.user!.country!
                                          : (tutor.country ?? ""),
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
                                      initialRating:
                                          tutor.avgRating?.toDouble() ?? 0,
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
                            tutor.bio ?? "",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                        switchFavorite(context);
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
                                              (tutor.user != null
                                                  ? tutor.user!.name!
                                                  : tutor.name!),
                                          ReportTutorDialog(
                                            tutorId: tutor.user == null
                                                ? tutor.userId!
                                                : tutor.user!.id!,
                                          ),
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
                                            feedbacks: tutor.user != null
                                                ? tutor.user!.feedbacks
                                                : tutor.feedbacks,
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
                              displayDialog(
                                context,
                                i18n.bookTutorBtnText,
                                BookCalendarDialog(
                                  tutorId: tutor.user == null
                                      ? tutor.userId
                                      : tutor.user!.id,
                                ),
                              ),
                            },
                          ),
                        ),
                        initializeVideoPlayerFuture != null
                            ? Container(
                                child: FutureBuilder(
                                  future: initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return AspectRatio(
                                        aspectRatio:
                                            videoController!.value.aspectRatio,
                                        child: VideoPlayer(videoController!),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                ),
                              )
                            : Container(),
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
                            tagsList:
                                tutor.specialties?.split(",").toList() ?? [],
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
                            tagsList:
                                tutor.languages?.split(",").toList() ?? [],
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
                      tutor.interests ?? "",
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
                      tutor.experience ?? "",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black26,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
