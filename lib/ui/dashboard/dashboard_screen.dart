import 'package:demo_localisation/constant/app_assets.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/pref/shared_pref.dart';
import 'package:demo_localisation/ui/common/widget/background_widget.dart';
import 'package:demo_localisation/ui/common/language_selector.dart';
import 'package:flutter/material.dart';
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
      setState(() {
        username = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        key: scaffoldKey,
        body: Container(
          child: Stack(
            children: [
              backgroundWidget(context),
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
                              // SystemNavigator.pop();
                              Navigator.pop(context);
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
                          ))
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
}
