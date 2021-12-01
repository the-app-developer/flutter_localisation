import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.red,
        colorScheme:  ThemeData().colorScheme.copyWith(primary: AppColors.primaryColor),
        fontFamily: Strings.robotoRegular,
        // fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: AppColors.primaryColor,
        appBarTheme: const AppBarTheme(
          color: AppColors.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.primaryColor),
        ),
        // textTheme: Theme.of(context).textTheme,
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
          color: Colors.black, iconTheme: IconThemeData(color: Colors.white)));
}
