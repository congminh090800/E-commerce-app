import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/user.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/reviews_tutor_dialog.dart';
import 'package:provider/provider.dart';

class AvatarSection extends StatefulWidget {
  const AvatarSection(
      {Key? key, required this.user, required this.onUpdateInfo})
      : super(key: key);
  final User user;
  final Function onUpdateInfo;
  @override
  _AvatarSectionState createState() => _AvatarSectionState();
}

class _AvatarSectionState extends State<AvatarSection> {
  String imagePath = "";
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

  Future<void> uploadAvatar(BuildContext context) async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      inspect(imagePath);
      // String fileName = imagePath.split('/').last;
      var formData = FormData.fromMap({
        'avatar': await MultipartFile.fromFile(
          imagePath,
          // filename: fileName,
        ),
      });
      await dio.post('user/uploadAvatar', data: formData);
      widget.onUpdateInfo();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Upload failed, try again later",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
      inspect(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    final ImagePicker picker = ImagePicker();
    return widget.user.id == null
        ? Container()
        : Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.zero,
                bottomRight: Radius.zero,
              ),
              border: Border.all(
                color: Colors.black26,
              ),
              gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.03, 0.03],
                colors: [Color.fromRGBO(0, 113, 240, 1), Colors.white],
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Consumer<AuthProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            width: 130,
                            height: 130,
                            child: CircleAvatar(
                              radius: 130,
                              backgroundImage: NetworkImage(
                                widget.user.avatar ?? "",
                              ),
                              backgroundColor: Colors.transparent,
                              child: Container(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor:
                                      Color.fromRGBO(0, 113, 240, 1),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            final XFile? image = await picker.pickImage(
                              source: ImageSource.gallery,
                              // maxWidth: 500,
                              // maxHeight: 500,
                              // imageQuality: 50,
                            );
                            if (image != null) {
                              setState(() {
                                imagePath = image.path;
                              });
                              await uploadAvatar(context);
                            }
                          },
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Super Ru",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  child: Text(
                    "ID: " + (widget.user.id ?? ""),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Container(
                  child: InkWell(
                    child: Text(
                      i18n!.profilePageOthersReivewYou,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 113, 240, 1),
                      ),
                    ),
                    onTap: () => {
                      displayDialog(
                        context,
                        i18n.profilePageOthersReivewYou,
                        ReviewsTutorDialog(
                          feedbacks: widget.user.feedbacks,
                        ),
                      ),
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
