import 'package:flutter/material.dart';
import 'package:lettutor/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en');
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    if (L10n.all
        .every((loc) => loc.languageCode.compareTo(locale.languageCode) != 0)) {
      return;
    }
    _locale = locale;
    notifyListeners();
  }
}
