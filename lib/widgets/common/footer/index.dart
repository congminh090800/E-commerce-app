import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

TextStyle highlighted = TextStyle(fontSize: 14, color: Color(0xff007bff));

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
        color: Color(0xFFE8E8E8),
      ))),
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(i18n!.privacy,
                  style: highlighted, textAlign: TextAlign.center),
              Text(i18n.terms, style: highlighted, textAlign: TextAlign.center),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          Text(i18n.copyright, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
