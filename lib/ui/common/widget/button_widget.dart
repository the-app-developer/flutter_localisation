import 'package:demo_localisation/constant/strings.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget elevatButtonWidget(
    {required BuildContext context,
    required VoidCallback callback,
    required String buttonTitle}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      onPressed: () {
        callback.call();
      },
      child: Container(
        child: buttonTitle.text
            .textStyle(const TextStyle(
              fontSize: 16,
              fontFamily: Strings.robotoRegular,
              fontWeight: FontWeight.w500,
            ))
            .make(),
      )).wh(
    MediaQuery.of(context).size.width,
    50,
  );
}
