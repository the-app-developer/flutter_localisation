import 'package:demo_localisation/constant/constant.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_localisation/l10n/l10n.dart';

class DemoProvider extends ChangeNotifier {
  DemoProvider() {
    init();
  }
  Future<void> init() async {
    String? langauge = await getPrefStringData(Constant.selectedLocaleStr);
    if (langauge == null) {
      Constant.currentLocale = "sr-cy";
      _locale =
          const Locale.fromSubtags(languageCode: "sr", scriptCode: "Cyrl");
      setLocale(_locale);
    } else {
      String isoCode = langauge;
      if (isoCode == "sr-cy") {
        Constant.currentLocale = "sr-cy";
        isoCode = "sr";
        _locale =
            const Locale.fromSubtags(languageCode: "sr", scriptCode: "Cyrl");
        setLocale(_locale);
      } else if (isoCode == "sr-lt") {
        Constant.currentLocale = "sr-lt";
        isoCode = "sr";
        _locale =
            const Locale.fromSubtags(languageCode: "sr", scriptCode: "Latn");
        setLocale(_locale);
      } else {
        Constant.currentLocale = langauge;
        _locale = Locale(langauge);
        setLocale(_locale);
      }
    }
  }

  late Locale _locale = const Locale("en");
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  
}
