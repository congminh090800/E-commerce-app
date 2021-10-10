import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageTutorDialog extends StatefulWidget {
  const MessageTutorDialog({Key? key}) : super(key: key);

  @override
  _MessageTutorDialogState createState() => _MessageTutorDialogState();
}

class _MessageTutorDialogState extends State<MessageTutorDialog> {
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Aa',
                border: UnderlineInputBorder(),
                suffixIcon: GestureDetector(
                  child: Icon(Icons.send),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
