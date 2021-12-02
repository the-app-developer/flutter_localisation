import 'package:demo_localisation/ui/common/widget/background_widget.dart';
import 'package:demo_localisation/ui/common/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/shared/controllers/theme_controller.dart';
import 'package:demo_localisation/shared/widgets/universal/page_body.dart';
import 'package:demo_localisation/ui/common/input_field.dart';
import 'package:demo_localisation/ui/login/login_screen.dart';
import 'package:demo_localisation/utility/utils.dart';

class SignupScreen extends StatefulWidget {
  ThemeController controller;
  SignupScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var restaurantNameController = TextEditingController();
  var restaurantUserNameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool obscurePwdext = true;
  bool obscureTextConfirmpPwd = true;
  @override
  Widget build(BuildContext context) {
    return PageBody(
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: Stack(
            children: [
              backgroundWidget(context),
              SafeArea(
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        AppLocalizations.of(context)!
                            .createnewaccount
                            .text
                            .xl3
                            .textStyle(const TextStyle(
                              fontFamily: Strings.robotoBold,
                              fontWeight: FontWeight.w700,
                            ))
                            .make(),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            elevation: 10,
                            child: Form(
                              key: formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    InputFieldWidget(
                                      parentContext: context,
                                      controller: usernameController,
                                      hintText: AppLocalizations.of(context)!
                                          .username,
                                      labelText: AppLocalizations.of(context)!
                                          .username,
                                      errorText: AppLocalizations.of(context)!
                                          .errentervalidemail,
                                      emailValidation: true,
                                      isPassword: false,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      parentContext: context,
                                      controller: restaurantNameController,
                                      hintText: AppLocalizations.of(context)!
                                          .resturantname,
                                      labelText: AppLocalizations.of(context)!
                                          .resturantname,
                                      errorText: AppLocalizations.of(context)!
                                          .errenterrestaurantname,
                                      emailValidation: false,
                                      isPassword: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      parentContext: context,
                                      controller: restaurantUserNameController,
                                      hintText: AppLocalizations.of(context)!
                                          .resturantusername,
                                      labelText: AppLocalizations.of(context)!
                                          .resturantusername,
                                      errorText: AppLocalizations.of(context)!
                                          .errenterrestaurantusername,
                                      emailValidation: false,
                                      isPassword: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    AppLocalizations.of(context)!
                                        .usernameshopuldbe
                                        .text
                                        .sm
                                        .make()
                                        .centered(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      parentContext: context,
                                      controller: passwordController,
                                      hintText: AppLocalizations.of(context)!
                                          .password,
                                      labelText: AppLocalizations.of(context)!
                                          .password,
                                      errorText: AppLocalizations.of(context)!
                                          .errenterpassword,
                                      emailValidation: false,
                                      isPassword: true,
                                      isShowPwdToggleText: true,
                                      pwdObsureText: true,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
                                      parentContext: context,
                                      controller: confirmPasswordController,
                                      hintText: AppLocalizations.of(context)!
                                          .confirmpassword,
                                      labelText: AppLocalizations.of(context)!
                                          .confirmpassword,
                                      errorText: AppLocalizations.of(context)!
                                          .errenterconfirmpassword,
                                      emailValidation: false,
                                      isPassword: true,
                                      isShowPwdToggleText: true,
                                      pwdObsureText: true,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        elevatButtonWidget(
                                context: context,
                                callback: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                  }
                                },
                                buttonTitle:
                                    AppLocalizations.of(context)!.signup)
                            .p20(),
                        didnthaveAccountWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget didnthaveAccountWidget() {
    return InkWell(
      onTap: () {
        Utils.redirectToNextScreen(
            context,
            LoginScreen(
              controller: widget.controller,
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLocalizations.of(context)!
              .alreadyhaveaccount
              .text
              .textStyle(const TextStyle(
                fontFamily: Strings.robotoRegular,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ))
              .make(),
          const SizedBox(
            width: 5,
          ),
          AppLocalizations.of(context)!
              .signin
              .text
              .textStyle(const TextStyle(
                fontFamily: Strings.robotoBold,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ))
              .make(),
        ],
      ),
    );
  }
}
