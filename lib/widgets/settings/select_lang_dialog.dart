import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lettutor/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatefulWidget {
  const SelectLanguageDialog({Key? key}) : super(key: key);

  @override
  _SelectLanguageDialogState createState() => _SelectLanguageDialogState();
}

class _SelectLanguageDialogState extends State<SelectLanguageDialog> {
  @override
  Widget build(BuildContext context) {
    LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
    Locale currentLocale = localeProvider.locale;
    print("current locale:" + currentLocale.languageCode);
    selectLang() {
      final provider = Provider.of<LocaleProvider>(context, listen: false);
      if (currentLocale.languageCode.compareTo('vi') == 0) {
        provider.setLocale(const Locale('en'));
      } else {
        provider.setLocale(const Locale('vi'));
      }
    }

    var i18n = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      i18n!.chooseLang,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      currentLocale.toString() == 'vi'
                          ? 'Tiếng Anh'
                          : 'Vietnam',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
            onTap: () => selectLang(),
          ),
        ],
      ),
    );
  }
}
