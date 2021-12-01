import 'package:demo_localisation/constant/app_assets.dart';
import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:demo_localisation/theme/app_theme.dart';
import 'package:demo_localisation/ui/common/language_selector.dart';
import 'package:demo_localisation/ui/signup/signup_screen.dart';
import 'package:demo_localisation/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String username = "Test";
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrefStringData("username").then((value) {
      username = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                AppAssets.bgImg,
                fit: BoxFit.cover,
              ).wh(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              SystemNavigator.pop();
                            },
                            child: Image.asset(
                              AppAssets.backIcon,
                            ).wh(50, 50),
                          ),
                          LanguageSelector(mainContext: context),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      "${AppLocalizations.of(context)!.welcome} $username"
                          .text
                          .xl3
                          .textStyle(const TextStyle(
                              fontFamily: Strings.robotoBold,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor))
                          .make()
                          .centered()
                    ],
                  ).wh(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
          child: "Sign in"
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
        text: const TextSpan(
          text: "Don’t have an account?",
          style: TextStyle(
              fontFamily: Strings.robotoRegular,
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.lightgrayColor),
          children: <TextSpan>[
            TextSpan(
                text: " Sign up",
                style: TextStyle(
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
