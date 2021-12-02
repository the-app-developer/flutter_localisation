import 'package:demo_localisation/constant/constant.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/shared/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:demo_localisation/l10n/l10n.dart';

class DemoProvider extends ChangeNotifier {
  DemoProvider() {
    init();
  }
  Future<void> init() async {
    String? langauge = await getPrefStringData(Constant.selectedLocaleStr);
    if (langauge == null) {
      Constant.currentLocale = "en";
      _locale =
          const Locale("en");
      setLocale(_locale);
    } else {
      Constant.currentLocale = langauge;
        _locale = Locale(langauge);
        setLocale(_locale);
    }
  }

  late Locale _locale = const Locale("en");
  Locale get locale => _locale;

  late ThemeController _themeController;
  ThemeController get themeController => _themeController;

  void setThemeController(ThemeController themeController) {
    _themeController = themeController;
  }

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
