import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/screens/tutors/details.dart';
import 'package:lettutor/widgets/common/fullscreen_dialog.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:provider/provider.dart';

class TutorListTile extends StatefulWidget {
  const TutorListTile({Key? key, required this.tutor}) : super(key: key);
  final Tutor tutor;
  @override
  _TutorListTileState createState() => _TutorListTileState();
}

class _TutorListTileState extends State<TutorListTile> {
  displayDialog(BuildContext context, String title, Widget content) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            FullScreenDialog(title: title, content: content),
        fullscreenDialog: true,
      ),
    ).then((value) {
      try {
        var dio = Http().client;
        WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
          var accessToken = Provider.of<AuthProvider>(context, listen: false)
              .auth
              .tokens!
              .access!
              .token;
          dio.options.headers["Authorization"] = "Bearer $accessToken";
          var res = await dio.get(
            "tutor/${widget.tutor.user == null ? widget.tutor.userId : (widget.tutor.user?.id ?? "")}",
          );
          Tutor data = Tutor.fromJson(res.data);
          print("is fav: ${data.isFavorite}");
          setState(() {
            isFavorited = data.isFavorite ?? false;
          });
        });
      } catch (e) {
        inspect(e);
      }
    });
  }

  bool isFavorited = false;
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
        data: {
          'tutorId': widget.tutor.user == null
              ? widget.tutor.userId
              : widget.tutor.user!.id
        },
      );
      inspect(res);
      setState(() {
        isFavorited = !isFavorited;
      });
    } catch (e) {
      inspect(e);
    }
  }

  @override
  void initState() {
    super.initState();
    isFavorited = widget.tutor.isFavorite ?? false;
  }

  @override
  Widget build(BuildContext context) {
    inspect(widget.tutor);
    return InkWell(
      onTap: () => {
        displayDialog(
          context,
          "",
          TutorDetails(
            tutorId: widget.tutor.userId ?? widget.tutor.user!.id!,
          ),
        ),
      },
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      widget.tutor.user != null
                          ? widget.tutor.user!.avatar!
                          : (widget.tutor.avatar ?? ""),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      child: Icon(
                        isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: isFavorited ? Colors.red : Colors.blue,
                        size: 26,
                      ),
                      onTap: () {
                        switchFavorite(context);
                      },
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    widget.tutor.user != null
                        ? widget.tutor.user!.name!
                        : (widget.tutor.name ?? ""),
                    style: TextStyle(fontSize: 22),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              transform: Matrix4.translationValues(-15, 0, 0),
              child: CountryCodePicker(
                alignLeft: true,
                initialSelection: widget.tutor.user != null
                    ? widget.tutor.user!.country!
                    : (widget.tutor.country ?? ""),
                showOnlyCountryWhenClosed: true,
                enabled: false,
                padding: EdgeInsets.all(0),
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(bottom: 20),
              child: RatingBar.builder(
                initialRating: widget.tutor.avgRating == null
                    ? 0
                    : widget.tutor.avgRating!.toDouble(),
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
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
              margin: EdgeInsets.only(bottom: 20),
              child: TagsList(
                tagsList: widget.tutor.specialties != null
                    ? widget.tutor.specialties!.split(",").toList()
                    : [],
                selectFirstItem: false,
                readOnly: true,
                isHorizontal: true,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                widget.tutor.bio ?? "default",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.centerRight,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       Container(
            //         margin: EdgeInsets.only(left: 10),
            //         child: CustomizedButton(
            //           btnText: i18n!.bookTutorBtnText,
            //           icon: Icons.event_available,
            //         ),
            //       ),
            //       Container(
            //         margin: EdgeInsets.only(left: 10),
            //         child: CustomizedButton(
            //           btnText: i18n.messageTutorBtnText,
            //           icon: Icons.chat,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
