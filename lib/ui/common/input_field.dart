import 'package:flutter/material.dart';

import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/utility/utils.dart';
import 'package:velocity_x/velocity_x.dart';

class InputFieldWidget extends StatefulWidget {
  TextEditingController? controller;
  String? hintText;
  String? labelText;
  String? errorText;
  bool isPassword = false;
  bool emailValidation = false;
  bool isShowPwdToggleText;
  bool pwdObsureText;
  InputFieldWidget({
    Key? key,
    this.controller,
    this.hintText,
    this.labelText,
    this.errorText,
    required this.isPassword,
    required this.emailValidation,
    this.isShowPwdToggleText = false,
    this.pwdObsureText = false,
  }) : super(key: key);

  @override
  _InputFieldWidgetState createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword ? widget.pwdObsureText : widget.isPassword ,
      cursorColor: AppColors.primaryColor,
      controller: widget.controller,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w500,
          fontFamily: Strings.robotoRegular),
      validator: (value) {
        bool emailValid = emailValidation(value!);
        if (value.toString().isEmpty) {
          return widget.errorText;
        } else if (widget.emailValidation && !emailValid) {
          return "Please enter valid email";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryColor)),
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.isShowPwdToggleText
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    widget.pwdObsureText = !widget.pwdObsureText;
                  });
                },
                child: Icon(widget.pwdObsureText
                    ? Icons.visibility_off
                    : Icons.visibility),
              )
            : Container().wh(0, 0),
      ),
    );
  }
}

Widget inputFieldWidget(
    {required TextEditingController? controller,
    String? hinttext,
    String? labeltext,
    String? errortext,
    bool ispassword = false,
    bool emailvalidation = false}) {
  return TextFormField(
    obscureText: ispassword,
    cursorColor: AppColors.primaryColor,
    controller: controller,
    style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        fontFamily: Strings.robotoRegular),
    validator: (value) {
      bool emailValid = emailValidation(value!);
      if (value.toString().isEmpty) {
        return errortext;
      } else if (emailvalidation && !emailValid) {
        return "Please enter valid email";
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor)),
      hintText: hinttext,
      labelText: labeltext,
    ),
  );
}
