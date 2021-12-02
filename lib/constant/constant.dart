import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Constant {
  static String selectedLocaleStr = "select_locale";

  static String fcmToken = "";
  static String isocode = "";
  static String currentLocale = "";
  static Widget setSpaceHeight(double value) {
    return SizedBox(
      height: value,
    );
  }

  static Widget setSpaceWidth(double value) {
    return SizedBox(
      width: value,
    );
  }
}

updateLanguage(Locale locale, BuildContext context) {
  String languageCode = locale.languageCode;
  Constant.currentLocale = languageCode;
  savePrefStringData(Constant.selectedLocaleStr, languageCode);
  Provider.of<DemoProvider>(context, listen: false).setLocale(locale);

  // Get.back();
  // Get.updateLocale(locale);
}

class FromScreenEnum {
  static String home = "home";
  static String eparcheyViewScreen = "eparcheyViewScreen";
  static String churchViewScreen = "churchViewScreen";
  static String mapViewScreen = "mapViewScreen";
  static String bookMarkScreen = "bookMarkScreen";
}
