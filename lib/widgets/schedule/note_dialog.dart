import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';

class NoteDialog extends StatefulWidget {
  const NoteDialog({Key? key}) : super(key: key);

  @override
  _NoteDialogState createState() => _NoteDialogState();
}

class _NoteDialogState extends State<NoteDialog> {
  bool isSubmitDisabled = true;
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
