import 'package:demo_localisation/constant/app_assets.dart';
import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/constant.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:demo_localisation/theme/app_theme.dart';
import 'package:demo_localisation/ui/common/language_selector.dart';
import 'package:demo_localisation/ui/dashboard/dashboard_screen.dart';
import 'package:demo_localisation/ui/common/input_field.dart';
import 'package:demo_localisation/ui/signup/signup_screen.dart';
import 'package:demo_localisation/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
  String dropdownValue = "English";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dropdownValue =
        Utils.getISOCodeFromLng(AppLocalizations.of(context)!.isocode);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Provider.of<DemoProvider>(context).locale,
      home: Scaffold(
        key: scaffoldKey,
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/bg_img.png",
                fit: BoxFit.cover,
              ).w(MediaQuery.of(context).size.width),
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
                              color: AppColors.primaryColor))
                          .make(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          color: Colors.white,
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
                                            // letterSpacing: 0.5,
                                            color: AppColors.lightblueColor))
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
                      signinButtonWidget().p(20),
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
                    padding: EdgeInsets.all(20.0),
                    child: LanguageSelector(
                      mainContext: context,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget signinButtonWidget() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 5,
            primary: AppColors.lightblueColor,
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
                  fontWeight: FontWeight.w600))
              .make(),
        )).wh(
      MediaQuery.of(context).size.width,
      50,
    );
  }

  Widget didnthaveAccountWidget() {
    return InkWell(
      onTap: () {
        Utils.redirectToScreen(context, const SignupScreen());
      },
      child: RichText(
        text: TextSpan(
          text: AppLocalizations.of(context)!.donthaveaccount,
          style: const TextStyle(
              fontFamily: Strings.robotoRegular,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.lightgrayColor),
          children: <TextSpan>[
            TextSpan(
                text: " ${AppLocalizations.of(context)!.signup}",
                style: const TextStyle(
                    fontFamily: Strings.robotoBold,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.lightblueColor)),
          ],
        ),
      ),
    );
  }
}
