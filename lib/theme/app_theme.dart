import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        // primarySwatch: Colors.red,
        brightness: Brightness.light,
        // colorScheme: ThemeData().colorScheme.copyWith(
        //     primary: AppColors.primaryColor, brightness: Brightness.light),
        fontFamily: Strings.robotoRegular,
        primaryColor: AppColors.lightblueColor,
        textTheme: const TextTheme(
          headline1: TextStyle(color: AppColors.primaryColor),
          headline2: TextStyle(color: AppColors.lightblueColor),
        ),
        cardColor: AppColors.lightCardColor,
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.black, selectionColor: AppColors.black),
        appBarTheme: const AppBarTheme(
          color: AppColors.lightblueColor,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.white),
        ),
        iconTheme: const IconThemeData(color: AppColors.black),
        hintColor: AppColors.alphablack,

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: AppColors.lightblueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ))),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        // primarySwatch: Colors.red,
        brightness: Brightness.dark,
        // colorScheme: ThemeData().colorScheme.copyWith(
        //     primary: AppColors.primaryColor, brightness: Brightness.light),
        fontFamily: Strings.robotoRegular,
        primaryColor: AppColors.white,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: AppColors.darkTitleColor,
          ),
          headline2: TextStyle(
            color: AppColors.darkTitleColor,
          ),
        ),
        cardColor: AppColors.darkCardColor,
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.white,
          selectionColor: AppColors.white,
        ),

        appBarTheme: const AppBarTheme(
          color: AppColors.primaryColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.white,
          ),
        ),
        hintColor: AppColors.alphaWhite,
        iconTheme: const IconThemeData(
          color: AppColors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 5,
                primary: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ))),
      );
}
