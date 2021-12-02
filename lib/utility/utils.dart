import 'package:demo_localisation/constant/constant.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:demo_localisation/pref/shared_pref.dart';

class Utils {
  static void redirectToNextScreen(BuildContext context, Widget routeWidget) {
    Navigator.of(context).pushAndRemoveUntil(
        PageTransition(child: routeWidget, type: PageTransitionType.fade),
        (route) => false);
  }

  static void redirectToScreen(BuildContext context, Widget routeWidget) {
    Navigator.push(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: routeWidget,
      ),
    );
  }

  updateLanguage(Locale locale, BuildContext context) {
    String languageCode = locale.languageCode;
    Constant.currentLocale = languageCode;
    savePrefStringData(Constant.selectedLocaleStr, languageCode);
    Provider.of<DemoProvider>(context, listen: false).setLocale(locale);
  }

  static String getISOCodeFromLng(String value) {
    if (value == "en") {
      return "English";
    } else if (value == "es") {
      return "Spanish";
    } else if (value == "fr") {
      return "French";
    } else if (value == "hi") {
      return "Hindi";
    }
    return "";
  }

  static String getLngFromISOCode(String value) {
    if (value == "English") {
      return "en";
    } else if (value == "Spanish") {
      return "es";
    } else if (value == "French") {
      return "fr";
    } else if (value == "Hindi") {
      return "hi";
    }
    return "en";
  }

  static List<String> getLangList() {
    List<String> lanList = ['English', 'Spanish', 'French', 'Hindi'];
    return lanList;
  }
}

bool emailValidation(String s) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(s.toString());
}

bool isDarkMode(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  bool darkModeOn = brightness == Brightness.dark;
  return darkModeOn;
}
