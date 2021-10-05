import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeMainContainer extends StatefulWidget {
  const HomeMainContainer({Key? key}) : super(key: key);

  @override
  _HomeMainContainerState createState() => _HomeMainContainerState();
}

class _HomeMainContainerState extends State<HomeMainContainer> {
  bool isDrawerOpen = false;
  switchDrawer() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
    });
  }

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
    return SingleChildScrollView(
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
                style: TextStyle(fontSize: 15.75),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Image.asset('assets/images/hero_pic.png'),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              height: 80,
              child: Text("footerfooterfooterfooter"),
            )
          ],
        ),
      ),
    );
  }
}
