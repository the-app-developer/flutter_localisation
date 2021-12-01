import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:demo_localisation/theme/app_theme.dart';
import 'package:demo_localisation/ui/common/input_field.dart';
import 'package:demo_localisation/ui/login/login_screen.dart';
import 'package:demo_localisation/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Provider.of<DemoProvider>(context).locale,
      home: Scaffold(
        key: scaffoldKey,
        body: SafeArea(
          child: Container(
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/bg_img.png",
                  fit: BoxFit.cover,
                ).wh(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
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
                                        .color(AppColors.lightgrayColor)
                                        .make()
                                        .centered(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    InputFieldWidget(
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
                        signinButtonWidget().p(20),
                        didnthaveAccountWidget(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
          }
        },
        child: Container(
          child: AppLocalizations.of(context)!
              .signup
              .text
              .textStyle(const TextStyle(
                  fontSize: 16,
                  fontFamily: Strings.robotoRegular,
                  fontWeight: FontWeight.w500))
              .make(),
        )).wh(
      MediaQuery.of(context).size.width,
      50,
    );
  }

  Widget didnthaveAccountWidget() {
    return InkWell(
      onTap: () {
        Utils.redirectToNextScreen(context, const LoginScreen());
      },
      child: RichText(
        text: TextSpan(
          text: AppLocalizations.of(context)!.alreadyhaveaccount,
          style: const TextStyle(
              fontFamily: Strings.robotoRegular,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.lightgrayColor),
          children: <TextSpan>[
            TextSpan(
                text: " ${AppLocalizations.of(context)!.signin}",
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
