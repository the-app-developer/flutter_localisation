import 'package:demo_localisation/shared/const/app_data.dart';
import 'package:demo_localisation/ui/common/widget/background_widget.dart';
import 'package:demo_localisation/ui/common/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/shared/controllers/theme_controller.dart';
import 'package:demo_localisation/shared/widgets/universal/page_body.dart';
import 'package:demo_localisation/ui/common/input_field.dart';
import 'package:demo_localisation/ui/common/language_selector.dart';
import 'package:demo_localisation/ui/dashboard/dashboard_screen.dart';
import 'package:demo_localisation/ui/signup/signup_screen.dart';
import 'package:demo_localisation/ui/theme/theme_screen.dart';
import 'package:demo_localisation/utility/utils.dart';

class LoginScreen extends StatefulWidget {
  ThemeController controller;
  LoginScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  bool spinnerVisible = false;
  bool isExpand = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double margins =
        AppData.responsiveInsets(MediaQuery.of(context).size.width);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;
    return Scaffold(
      key: scaffoldKey,
      body: PageBody(
        child: Stack(
          children: [
            backgroundWidget(context),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLocalizations.of(context)!
                        .signintoaccount
                        .text
                        .xl3
                        .textStyle(const TextStyle(
                          fontFamily: Strings.robotoBold,
                          fontWeight: FontWeight.w700,
                          // color: AppColors.primaryColor,
                        ))
                        .make(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(5.0),
                        // ),
                        // color: Theme.of(context).cardColor,
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
                                  hintText:
                                      AppLocalizations.of(context)!.username,
                                  labelText:
                                      AppLocalizations.of(context)!.username,
                                  errorText: AppLocalizations.of(context)!
                                      .errentervalidemail,
                                  emailValidation: true,
                                  isPassword: false,
                                  isShowPwdToggleText: false,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                InputFieldWidget(
                                  parentContext: context,
                                  controller: passwordController,
                                  hintText:
                                      AppLocalizations.of(context)!.password,
                                  labelText:
                                      AppLocalizations.of(context)!.password,
                                  errorText: AppLocalizations.of(context)!
                                      .errenterpassword,
                                  emailValidation: false,
                                  isPassword: true,
                                  isShowPwdToggleText: true,
                                  pwdObsureText: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: AppLocalizations.of(context)!
                                      .forgotpassword
                                      .text
                                      .textStyle(const TextStyle(
                                        fontFamily: Strings.robotoBold,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ))
                                      .make(),
                                ),
                                const SizedBox(
                                  height: 5,
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
                                savePrefStringData(
                                    "username", usernameController.text);
                                Utils.redirectToNextScreen(
                                    context, const DashboardScreen());
                              }
                            },
                            buttonTitle: AppLocalizations.of(context)!.signin)
                        .p20(),
                    elevatButtonWidget(
                            context: context,
                            callback: () {
                              Utils.redirectToScreen(
                                  context,
                                  ThemeScreen(
                                    controller: widget.controller,
                                  ));
                            },
                            buttonTitle: "Theme")
                        .p20(),
                    didnthaveAccountWidget(),
                  ],
                ).wh(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LanguageSelector(
                    mainContext: context,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget signinButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            )),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            savePrefStringData("username", usernameController.text);
            Utils.redirectToNextScreen(context, const DashboardScreen());
          }
        },
        child: Container(
          child: AppLocalizations.of(context)!
              .signin
              .text
              .textStyle(const TextStyle(
                fontSize: 16,
                fontFamily: Strings.robotoRegular,
                fontWeight: FontWeight.w600,
              ))
              .make(),
        )).wh(
      MediaQuery.of(context).size.width,
      50,
    );
  }

  Widget customThemeWidget() {
    return ElevatedButton(
        onPressed: () {
          Utils.redirectToScreen(
              context,
              ThemeScreen(
                controller: widget.controller,
              ));
        },
        child: Container(
          child: "Theme"
              .text
              .textStyle(const TextStyle(
                fontSize: 16,
                fontFamily: Strings.robotoRegular,
                fontWeight: FontWeight.w600,
              ))
              .make(),
        )).wh(
      MediaQuery.of(context).size.width,
      50,
    );
  }

  Widget didnthaveAccountWidget() {
    return InkWell(
      onTap: () {
        Utils.redirectToScreen(
            context,
            SignupScreen(
              controller: widget.controller,
            ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppLocalizations.of(context)!
              .donthaveaccount
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
              .signup
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
