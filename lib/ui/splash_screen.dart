import 'dart:async';

import 'package:demo_localisation/constant/app_assets.dart';
import 'package:demo_localisation/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:ui' as ui;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Locale locale = ui.window.locale;

    Timer(const Duration(seconds: 3), () async {
      getPrefStringData(Constant.selectedLocaleStr).then((value) {
        if (value == null) {
          Locale locale = const Locale("en");
          updateLanguage(locale, context);
        } else {
          Locale locale = Locale(value);
          updateLanguage(locale, context);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Image.asset(
            AppAssets.bgImg,
            fit: BoxFit.cover,
          ).w(MediaQuery.of(context).size.width),
          const FlutterLogo().wh(100, 100).centered()
        ],
      ),
    );
  }
}
