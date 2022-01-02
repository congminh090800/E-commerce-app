import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/real_models/tutor.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:lettutor/widgets/tutors/tags_list.dart';
import 'package:lettutor/widgets/tutors/tutors_list.dart';
import 'package:provider/provider.dart';

class SearchTutorPage extends StatefulWidget {
  const SearchTutorPage({Key? key}) : super(key: key);

  @override
  _SearchTutorPageState createState() => _SearchTutorPageState();
}

class _SearchTutorPageState extends State<SearchTutorPage> {
  List<Tutor> tutors = [];
  int count = 0;
  int perPage = 5;
  int page = 1;
  bool loading = false;
  @override
  void initState() {
    super.initState();
    getTutors();
  }

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
  void getTutors() {
    try {
      setState(() {
        loading = true;
      });
      var dio = Http().client;
      var query = {
        'perPage': perPage.toString(),
        'page': page.toString(),
      };
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
        var accessToken = Provider.of<AuthProvider>(context, listen: false)
            .auth
            .tokens!
            .access!
            .token;
        dio.options.headers["Authorization"] = "Bearer $accessToken";
        var res = await dio.get(
          "tutor/more",
          queryParameters: query,
        );
        Iterable favIter = res.data["favoriteTutor"];
        List<Tutor> favTutors = List<Tutor>.from(
          await Future.wait(
            favIter.map(
              (tutor) async {
                String id = tutor["secondId"];
                var tutorRes = await dio.get("tutor/$id");
                var detail = tutorRes.data;
                var data = Tutor.fromJson(detail);
                return data;
              },
            ),
          ),
        );
        Iterable iter = res.data["tutors"]["rows"];
        List<Tutor> paginatedData =
            List<Tutor>.from(iter.map((tutor) => Tutor.fromJson(tutor)));
        paginatedData = paginatedData.map((element) {
          if (favTutors
              .any((favTutor) => favTutor.user?.email == element.email)) {
            element.isFavorite = true;
          }
          return element;
        }).toList();
        setState(() {
          tutors.addAll(paginatedData);
          count = res.data["tutors"]["count"];
          loading = false;
        });
      });
    } catch (e) {
      inspect(e);
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: EdgeInsets.all(0),
                  filled: true,
                  fillColor: Colors.black12,
                  hintText: i18n!.searchTutorPlaceholder,
                  prefixIcon: GestureDetector(
                    child: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: TagsList(
                tagsList: tagsList,
                isHorizontal: true,
              ),
              padding: EdgeInsets.only(bottom: 10),
            ),
            // Container(
            //   alignment: Alignment.centerLeft,
            //   margin: EdgeInsets.only(bottom: 20),
            //   child: Row(
            //     children: [
            //       Text(i18n.searchNationality + ": "),
            //       Expanded(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white54,
            //             borderRadius: BorderRadius.circular(10),
            //             border: Border.all(
            //               color: Colors.black38,
            //               width: 1,
            //             ),
            //           ),
            //           child: CountryCodePicker(
            //             onChanged: (CountryCode countryCode) {
            //               print(
            //                 "New Country selected: " + countryCode.toString(),
            //               );
            //             },
            //             initialSelection: 'VN',
            //             showOnlyCountryWhenClosed: true,
            //             showCountryOnly: true,
            //             padding: EdgeInsets.all(0),
            //             alignLeft: true,
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 20),
              child: Container(
                child: Column(
                  children: [
                    tutors.length > 0
                        ? TutorsList(
                            tutors: this.tutors,
                          )
                        : loading == true
                            ? Container()
                            : Container(
                                child: Text(
                                  "No data",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 20),
                              ),
                    perPage * page < count
                        ? Container(
                            child: CustomizedButton(
                              btnText: "Load more",
                              onTap: () {
                                setState(() {
                                  page = page + 1;
                                });
                                getTutors();
                              },
                              hasBorder: false,
                              textSize: 20,
                            ),
                            margin: EdgeInsets.only(
                              top: 16,
                              bottom: 4,
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
            loading == true
                ? Container(
                    child: CircularProgressIndicator(),
                    padding: EdgeInsets.only(top: 20),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
