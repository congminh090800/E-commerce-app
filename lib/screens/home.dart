import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/widgets/common/footer/index.dart';
import 'package:lettutor/widgets/common/header/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<String> heroTitleWords =
        AppLocalizations.of(context)!.heroTitle.split(", ");
    var listText = List.generate(heroTitleWords.length, (index) {
      TextStyle textStyle =
          index == 0 ? TextStyle() : TextStyle(color: Color(0xfffc6b10));
      String suffix = index == heroTitleWords.length - 1 ? "" : ", ";
      return TextSpan(
          text: heroTitleWords[index].toUpperCase() + suffix, style: textStyle);
    });
    Widget heroTitle = RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
            fontSize: 35,
            color: Color(0xff0071f0),
            fontWeight: FontWeight.w900),
        children: listText,
      ),
    );
    return Header(
      screen: SingleChildScrollView(
        child: Container(
          color: Color(0xfff5f6ff),
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: heroTitle,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.heroDescription,
                  style: TextStyle(fontSize: 15.75, color: Color(0xff1a1a1a)),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.slogan,
                      style: TextStyle(
                        fontSize: 15.75,
                        color: Color(0xff1a1a1a),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      AppLocalizations.of(context)!.highlightedSlogan,
                      style: TextStyle(
                        fontSize: 15.75,
                        color: Color(0xfffc6b10),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                alignment: Alignment.center,
                child: TextButton(
                  child: Text(
                    AppLocalizations.of(context)!.bookBtnText,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                      shape: StadiumBorder(),
                      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                      backgroundColor: Color(0xfffc6b10)),
                ),
              ),
              Container(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Image.asset('assets/images/hero_pic.png'),
                ),
              ),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
