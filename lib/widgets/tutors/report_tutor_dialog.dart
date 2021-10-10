import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/customized_button.dart';

class ReportTutorDialog extends StatefulWidget {
  const ReportTutorDialog({Key? key}) : super(key: key);

  @override
  _ReportTutorDialogState createState() => _ReportTutorDialogState();
}

class _ReportTutorDialogState extends State<ReportTutorDialog> {
  bool isSubmitDisabled = true;
  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.8;
    var i18n = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.center,
      child: Column(
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
                  " " + i18n!.reportTutorDialogDescription,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 30, top: 30),
            child: TextFormField(
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                hintText: i18n.reportTutorDialogPlaceholder,
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
                ),
                SizedBox(
                  width: 15,
                ),
                CustomizedButton(
                  btnText: i18n.submitBtnText,
                  isDisabled: isSubmitDisabled,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
