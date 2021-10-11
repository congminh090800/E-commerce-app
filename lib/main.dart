import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:lettutor/screens/schedule.dart';
import 'package:provider/provider.dart';

import 'l10n/l10n.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        var provider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LetTutor',
          locale: provider.locale,
          localizationsDelegates: [
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
          /*REPLACE THIS TO VISIT OTHER SCREEN, CLASS NAME OF THE FILES IN /lib/screens IS SCREEN NAMES */
          home: SchedulePage(),
          /*REPLACE THIS TO VISIT OTHER SCREEN, CLASS NAME OF THE FILES IN /lib/screens IS SCREEN NAMES */
        );
      },
    );
  }
}
