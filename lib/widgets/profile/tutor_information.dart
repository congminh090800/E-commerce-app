import 'dart:developer';
import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/common/submit_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorInformation extends StatefulWidget {
  const TutorInformation(
      {Key? key, required this.user, required this.onUpdateInfo})
      : super(key: key);
  final User user;
  final Function onUpdateInfo;
  @override
  _TutorInformationState createState() => _TutorInformationState();
}

enum Level { Beginner, Intermediate, Advanced }

class _TutorInformationState extends State<TutorInformation> {
  Level? _level = Level.Beginner;
  final tutorInfoForm = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  VideoPlayerController? videoController;
  Future<void>? initializeVideoPlayerFuture;
  VideoPlayerController? newVidController;
  Future<void>? initializeNewVideoPlayer;
  User? userData;
  var interestsController;
  var educationController;
  var expController;
  var professionController;
  var introController;
  String? language;
  String videoPath = "";
  List<String> specialties = [];
  var tagsList = [
    "business-english",
    "conversational-english",
    "english-for-kids",
    "ielts",
    "toeic",
    "starters",
    "movers",
    "flyers",
    "ket",
    "pet",
    "toefl"
  ];
  @override
  void initState() {
    super.initState();
    setState(() {
      userData = widget.user;
      introController = TextEditingController(text: userData!.tutorInfo!.bio);
      interestsController =
          TextEditingController(text: userData!.tutorInfo!.interests);
      educationController =
          TextEditingController(text: userData!.tutorInfo!.education);
      expController =
          TextEditingController(text: userData!.tutorInfo!.experience);
      professionController =
          TextEditingController(text: userData!.tutorInfo!.profession);
      language = userData!.tutorInfo!.languages;
      specialties = userData!.tutorInfo!.specialties!.split(",");
      print(specialties);
      String? level = userData!.level;
      if (level!.toLowerCase() == "beginner") {
        _level = Level.Beginner;
      } else if (level.toLowerCase() == "intermediate") {
        _level = Level.Intermediate;
      } else {
        _level = Level.Advanced;
      }
      videoController = VideoPlayerController.network(
        userData!.tutorInfo!.video!,
      );
      initializeVideoPlayerFuture = videoController!.initialize();
      videoController!.setLooping(true);
      videoController!.play();
    });
  }

  @override
  void dispose() {
    videoController?.dispose();
    newVidController?.dispose();
    super.dispose();
  }

  Future<void> updateTutorInfo(BuildContext context) async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      // String fileName = imagePath.split('/').last;
      var formData = FormData.fromMap({
        "interests": interestsController.text,
        "experience": expController.text,
        "education": educationController.text,
        "profession": professionController.text,
        "bio": introController.text,
        "targetStudent": _level.toString().split('.').last,
        "specialties": specialties.join(","),
        "video":
            videoPath.isEmpty ? null : await MultipartFile.fromFile(videoPath),
        "languages": language
      });
      await dio.post('tutor', data: formData);
      widget.onUpdateInfo();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Update tutor data failed, try again later",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.user);
    var i18n = AppLocalizations.of(context);
    return Form(
      key: tutorInfoForm,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            Divider(
              color: Colors.red,
            ),
            Text(
              i18n!.profileStepCVSection,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              i18n.profileStepCVDescription,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.profileStepInterestsPlaceholder,
                  alignLabelWithHint: true,
                  hintMaxLines: 5,
                  labelText: i18n.profileStepInterestsField,
                ),
                controller: interestsController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.profileStepEducationPlaceholder,
                  alignLabelWithHint: true,
                  hintMaxLines: 5,
                  labelText: i18n.profileStepEducationField,
                ),
                controller: educationController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.profileStepExperienceField,
                ),
                controller: expController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.profileStepProfession,
                ),
                controller: professionController,
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Text(
              i18n.profileStepLangSection,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: Row(
                children: [
                  Text(i18n.profileStepLanguagesField + ": "),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black12,
                          width: 1,
                        ),
                      ),
                      child: CountryCodePicker(
                        onChanged: (CountryCode countryCode) {
                          setState(() {
                            language = countryCode.toString();
                          });
                        },
                        initialSelection: language,
                        showOnlyCountryWhenClosed: true,
                        showCountryOnly: true,
                        alignLeft: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Text(
              i18n.profileStepTargetSection,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 1),
                  ),
                  hintText: i18n.profileStepIntroductionPlaceholder,
                  alignLabelWithHint: true,
                  hintMaxLines: 5,
                  labelText: i18n.profileStepIntroductionField,
                ),
                controller: introController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    i18n.profileStepBestAtTeachingField,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16),
                  ),
                  ListTile(
                    title: Text(i18n.profileStepBestAtTeachingBeginnerOption),
                    leading: Radio<Level>(
                      value: Level.Beginner,
                      groupValue: _level,
                      onChanged: (Level? value) {
                        setState(() {
                          _level = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title:
                        Text(i18n.profileStepBestAtTeachingIntermediateOption),
                    leading: Radio<Level>(
                      value: Level.Intermediate,
                      groupValue: _level,
                      onChanged: (Level? value) {
                        setState(() {
                          _level = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(i18n.profileStepBestAtTeachingAdvancedOption),
                    leading: Radio<Level>(
                      value: Level.Advanced,
                      groupValue: _level,
                      onChanged: (Level? value) {
                        setState(() {
                          _level = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                i18n.profileStepSpecialtiesField,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: TagsList(
                tagsList: tagsList,
                selectFirstItem: false,
                onSelectedList: (p0) {
                  setState(() {
                    specialties = p0;
                  });
                  print(p0);
                },
                defaultSelected: specialties,
              ),
            ),
            Divider(
              color: Colors.red,
            ),
            Text(
              i18n.videoStepIntroSection,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            CustomizedButton(
              btnText: i18n.videoStepChooseBtnText,
              icon: Icons.image,
              onTap: () async {
                final XFile? video =
                    await picker.pickVideo(source: ImageSource.gallery);
                if (video != null) {
                  setState(() {
                    videoPath = video.path;
                    newVidController =
                        VideoPlayerController.file(File(video.path));
                    initializeNewVideoPlayer = newVidController!.initialize();
                    newVidController!.setLooping(true);
                    newVidController!.play();
                  });
                }
              },
            ),
            initializeVideoPlayerFuture != null
                ? Container(
                    child: FutureBuilder(
                      future: initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: videoController!.value.aspectRatio,
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
            initializeNewVideoPlayer != null
                ? Container(
                    child: FutureBuilder(
                      future: initializeNewVideoPlayer,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return AspectRatio(
                            aspectRatio: newVidController!.value.aspectRatio,
                            child: VideoPlayer(newVidController!),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: 150,
                  child: SubmitButton(
                    btnText: i18n.saveChangesBtnText,
                    onTap: () async {
                      if (tutorInfoForm.currentState!.validate()) {
                        await updateTutorInfo(context);
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
