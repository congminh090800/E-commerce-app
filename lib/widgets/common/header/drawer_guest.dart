import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/screens/home.dart';
import 'package:lettutor/screens/reset_password.dart';
import 'package:lettutor/screens/sign_in.dart';
import 'package:lettutor/screens/sign_up.dart';
import 'package:lettutor/widgets/common/boiler_plate.dart';
import 'package:lettutor/widgets/common/header/no_drawer_header.dart';
import 'package:provider/provider.dart';

class DrawerGuest extends StatelessWidget {
  const DrawerGuest({Key? key}) : super(key: key);
  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoilerPlate(
              page: SignInPage(),
            ),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoilerPlate(
              page: SignUpPage(),
            ),
          ),
        );
        break;
      case 2:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoilerPlate(
              page: HomePage(),
            ),
          ),
        );
        break;
      case 3:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoilerPlate(
              page: NoDrawerHeader(),
            ),
          ),
        );
        break;
      case 4:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BoilerPlate(
              page: ResetPasswordPage(),
            ),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    Locale currentLocale = localeProvider.locale;
    log("current locale:" + currentLocale.languageCode);
    Widget flagIcon = ClipOval(
      child: SvgPicture.asset(
        'assets/images/ic_vn_flag.svg',
        width: 30,
        height: 30,
      ),
    );
    Widget textLang = Text(AppLocalizations.of(context)!.languageVi,
        style: TextStyle(fontSize: 14, color: Color(0xff007bff)));
    if (currentLocale.languageCode.compareTo('vi') == 0) {
      flagIcon = ClipOval(
        child: SvgPicture.asset(
          'assets/images/ic_us_flag.svg',
          width: 30,
          height: 30,
        ),
      );
      textLang = Text(AppLocalizations.of(context)!.languageEn,
          style: TextStyle(fontSize: 14, color: Color(0xff007bff)));
    }
    selectLang() {
      final provider = Provider.of<LocaleProvider>(context, listen: false);
      if (currentLocale.languageCode.compareTo('vi') == 0) {
        provider.setLocale(const Locale('en'));
      } else {
        provider.setLocale(const Locale('vi'));
      }
    }

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: InkWell(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.landingPageTitle,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff007bff),
                  ),
                ),
              ),
              onTap: () => {
                selectedItem(context, 2),
              },
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            child: InkWell(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.signIn,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff007bff),
                  ),
                ),
              ),
              onTap: () => {
                selectedItem(context, 0),
              },
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            child: InkWell(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.signUp,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff007bff),
                  ),
                ),
              ),
              onTap: () => {
                selectedItem(context, 1),
              },
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            child: InkWell(
              child: Center(
                child: Text(
                  "Dashboard for testing",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff007bff),
                  ),
                ),
              ),
              onTap: () => {
                selectedItem(context, 3),
              },
            ),
            padding: EdgeInsets.all(8),
          ),
          Container(
            child: InkWell(
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.resetPasswordTitle,
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff007bff),
                  ),
                ),
              ),
              onTap: () => {
                selectedItem(context, 4),
              },
            ),
            padding: EdgeInsets.all(8),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => selectLang(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 25),
                      child: Text(
                        AppLocalizations.of(context)!.chooseLang + ":",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF1A1A1A)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 25, left: 5, right: 10),
                      child: Center(
                        child: flagIcon,
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(bottom: 25), child: textLang),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
