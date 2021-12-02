import 'package:demo_localisation/shared/const/app_data.dart';
import 'package:demo_localisation/shared/widgets/universal/page_body.dart';
import 'package:demo_localisation/ui/common/widget/background_widget.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/shared/const/app_color.dart';
import 'package:demo_localisation/shared/controllers/theme_controller.dart';
import 'package:demo_localisation/ui/theme/theme_popup_menu.dart';

class ThemeScreen extends StatefulWidget {
  final ThemeController controller;
  const ThemeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _ThemeScreenState createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  Color? selectPrimaryColor = AppColors.primaryColor;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double margins =
        AppData.responsiveInsets(MediaQuery.of(context).size.width);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle headline4 = textTheme.headline4!;

    return PageBody(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          elevation: 15,
          title: "Theme".text.bold.textStyle(const TextStyle(
              // color: Theme.of(context).textTheme.headline1!.color,
              )).make(),
        ),
        key: scaffoldKey,
        body: Container(
          child: Stack(
            children: [
              backgroundWidget(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlexThemeModeSwitch(
                    themeMode: widget.controller.themeMode,
                    onThemeModeChanged: widget.controller.setThemeMode,
                    flexSchemeData:
                        AppColor.schemes[widget.controller.schemeIndex],
                    optionButtonBorderRadius:
                        widget.controller.useSubThemes ? 12 : 4,
                    buttonOrder: FlexThemeModeButtonOrder.lightSystemDark,
                  ),
                  const SizedBox(height: 8),
                  // Theme popup menu button to select color scheme.
                  ThemePopupMenu(
                    contentPadding: EdgeInsets.zero,
                    schemeIndex: widget.controller.schemeIndex,
                    onChanged: (value) {
                      widget.controller.setSchemeIndex(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
