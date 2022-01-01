import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:video_player/video_player.dart';

class BecomeTutorPage extends StatefulWidget {
  const BecomeTutorPage({Key? key}) : super(key: key);

  @override
  _BecomeTutorPageState createState() => _BecomeTutorPageState();
}

enum Level { Beginner, Intermediate, Advanced }

class _BecomeTutorPageState extends State<BecomeTutorPage> {
  final stepOneForm = GlobalKey<FormState>();
  final stepTwoForm = GlobalKey<FormState>();
  int _currentStep = 0;
  bool showDatePicker = false;
  Level? _level = Level.Beginner;
  String imagePath = "";
  String countryCode = "";
  String language = "";
  final ImagePicker picker = ImagePicker();
  DateTime? birthday;
  var nameController = TextEditingController();
  var interestsController = TextEditingController();
  var educationController = TextEditingController();
  var expController = TextEditingController();
  var professionController = TextEditingController();
  var introController = TextEditingController();
  List<String> specialties = [];
  VideoPlayerController? videoController;
  Future<void>? initializeVideoPlayerFuture;
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
      countryCode = "VN";
      language = "VN";
    });
  }

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    List<Step> getSteps() => [
          Step(
            isActive: _currentStep >= 0,
            title: Text(
              i18n!.profileTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Form(
              key: stepOneForm,
              child: Container(
                padding: EdgeInsets.only(top: 0),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.5),
                      child: Text(
                        i18n.profileStepTitle,
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.5),
                      child: Text(
                        i18n.profileStepDescription1,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Text(
                        i18n.profileStepDescription2,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.5),
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.red,
                          ),
                          Text(
                            i18n.profileStepBasicInfoSection,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          CustomizedButton(
                            btnText: i18n.profileStepUploadHint,
                            icon: Icons.image,
                            onTap: () async {
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);
                              if (image != null) {
                                setState(() {
                                  imagePath = image.path;
                                });
                              }
                            },
                          ),
                          imagePath.isEmpty
                              ? Text(
                                  "required",
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container(),
                          imagePath != ""
                              ? Container(
                                  child: Image.file(File(imagePath)),
                                )
                              : Container(),
                          Container(
                            margin: EdgeInsets.only(bottom: 20, top: 20),
                            child: TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(width: 1),
                                ),
                                hintText: i18n.profileStepTutorNameField,
                              ),
                              controller: nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Required";
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Text(i18n.profileStepNationalityField + ": "),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                    ),
                                    child: CountryCodePicker(
                                      onChanged: (CountryCode country) {
                                        setState(() {
                                          countryCode = country.toString();
                                        });
                                      },
                                      initialSelection: countryCode,
                                      showOnlyCountryWhenClosed: true,
                                      showCountryOnly: true,
                                      alignLeft: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: CustomizedButton(
                              btnText: birthday == null
                                  ? i18n.profileStepBirthdayField
                                  : birthday.toString(),
                              onTap: () {
                                setState(() {
                                  showDatePicker = true;
                                });
                              },
                            ),
                          ),
                          if (showDatePicker == true)
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: SfDateRangePicker(
                                showTodayButton: true,
                                view: DateRangePickerView.month,
                                onSelectionChanged:
                                    (DateRangePickerSelectionChangedArgs args) {
                                  setState(() {
                                    birthday = args.value;
                                    showDatePicker = false;
                                  });
                                },
                                onCancel: () {
                                  setState(() {
                                    showDatePicker = false;
                                  });
                                },
                              ),
                            ),
                          birthday == null
                              ? Text(
                                  "required",
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container(),
                          Divider(
                            color: Colors.red,
                          ),
                          Text(
                            i18n.profileStepCVSection,
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
                                        color: Colors.black38,
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
                                hintText:
                                    i18n.profileStepIntroductionPlaceholder,
                                alignLabelWithHint: true,
                                hintMaxLines: 5,
                                labelText: i18n.profileStepIntroductionField,
                              ),
                              controller: introController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Required";
                                } else {
                                  return null;
                                }
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
                                  title: Text(i18n
                                      .profileStepBestAtTeachingBeginnerOption),
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
                                  title: Text(i18n
                                      .profileStepBestAtTeachingIntermediateOption),
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
                                  title: Text(i18n
                                      .profileStepBestAtTeachingAdvancedOption),
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
                          TagsList(
                            tagsList: tagsList,
                            selectFirstItem: false,
                            onSelectedList: (list) {
                              setState(() {
                                specialties = list;
                              });
                            },
                          ),
                          specialties.length == 0
                              ? Text(
                                  "required",
                                  style: TextStyle(color: Colors.red),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Step(
            isActive: _currentStep >= 1,
            title: Text(
              i18n.videoIntroTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Form(
              key: stepTwoForm,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10.5),
                      child: Text(
                        i18n.videoStepTitle,
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 10.5),
                      child: Text(
                        i18n.videoStepDescription,
                        style: TextStyle(fontSize: 14),
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
                            videoController =
                                VideoPlayerController.file(File(video.path));
                            initializeVideoPlayerFuture =
                                videoController!.initialize();
                            videoController!.setLooping(true);
                            videoController!.play();
                          });
                        }
                      },
                    ),
                    videoController == null
                        ? Text(
                            "required",
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
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
                  ],
                ),
              ),
            ),
          ),
          Step(
            isActive: _currentStep >= 2,
            title: Text(
              i18n.approvalTutorRegisteringStep,
              overflow: TextOverflow.ellipsis,
            ),
            content: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_satisfied_alt,
                    size: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      i18n.approvalStepNotification,
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ];
    return Stepper(
      type: StepperType.vertical,
      steps: getSteps(),
      currentStep: _currentStep,
      onStepContinue: () {
        bool isLastStep = _currentStep == getSteps().length - 1;
        if (isLastStep) {
          Navigator.of(context).pop();
        } else {
          if (_currentStep == 0) {
            if (stepOneForm.currentState!.validate() &&
                imagePath.isNotEmpty &&
                birthday != null &&
                specialties.length > 0) {
              setState(() {
                _currentStep += 1;
              });
            }
          } else if (_currentStep == 1) {
            if (stepTwoForm.currentState!.validate() &&
                videoController != null) {
              setState(() {
                _currentStep += 1;
              });
            }
          }
        }
      },
      onStepCancel: () {
        if (_currentStep > 0) {
          setState(() {
            _currentStep -= 1;
          });
        }
      },
      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
        return Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            children: [
              _currentStep < getSteps().length - 1
                  ? Expanded(
                      child: ElevatedButton(
                        child: Text(i18n!.tutorRegisterBackBtnText),
                        onPressed: onStepCancel,
                      ),
                    )
                  : Container(),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: ElevatedButton(
                  child: Text(_currentStep == getSteps().length - 1
                      ? i18n!.approvalStepBackBtnText
                      : i18n!.tutorRegisterNextBtnText),
                  onPressed: onStepContinue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
