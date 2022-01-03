import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/constants/http.dart';
import 'package:lettutor/provider/auth_provider.dart';
import 'package:lettutor/widgets/common/customized_button.dart';
import 'package:provider/provider.dart';

class NoteDialog extends StatefulWidget {
  const NoteDialog({Key? key, required this.scheduleId}) : super(key: key);
  final String scheduleId;
  @override
  _NoteDialogState createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  bool isSubmitDisabled = true;
  TextEditingController content = TextEditingController();
  Future<bool> updateNote(BuildContext context) async {
    try {
      var dio = Http().client;
      var accessToken = Provider.of<AuthProvider>(context, listen: false)
          .auth
          .tokens!
          .access!
          .token;
      dio.options.headers["Authorization"] = "Bearer $accessToken";
      await dio.post(
        "booking/student-request/${widget.scheduleId}",
        data: {
          'studentRequest': content.text,
        },
      );
      return true;
    } catch (e) {
      inspect(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    var i18n = AppLocalizations.of(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.report,
                    color: Colors.blue,
                    size: 20,
                  ),
                ),
                Container(
                  width: cWidth,
                  child: Text(
                    " " + i18n!.noteDialogHeader,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 30, top: 30),
              child: TextFormField(
                minLines: 10,
                maxLines: 20,
                decoration: InputDecoration(
                  hintText: i18n.noteDialogGuide,
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      isSubmitDisabled = true;
                    } else {
                      isSubmitDisabled = false;
                    }
                  });
                },
                controller: content,
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomizedButton(
                    btnText: i18n.cancelBtnText,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: 5,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  CustomizedButton(
                    btnText: i18n.submitBtnText,
                    isDisabled: isSubmitDisabled,
                    borderRadius: 5,
                    background: Colors.blue,
                    hasBorder: false,
                    primaryColor: Colors.white,
                    onTap: () async {
                      bool result = await updateNote(context);
                      if (result == true) {
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Update note failed, try again later",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
