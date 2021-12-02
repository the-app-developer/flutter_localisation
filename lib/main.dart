import 'package:demo_localisation/l10n/l10n.dart';
import 'package:demo_localisation/provider/demo_provider.dart';
import 'package:demo_localisation/shared/utils/app_scroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'ui/login/login_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import '../shared/const/app_color.dart';
import '../shared/const/app_data.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeService themeService = ThemeServiceHive('flex_scheme_box_4');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load all the preferred theme settings, while the app is loading, before
  // MaterialApp is created. This prevents a sudden theme change when the app
  // is first displayed.
  await themeController.loadAll();
  runApp(ChangeNotifierProvider(
    create: (context) => DemoProvider(),
    child: MyApp(
      themeController: themeController,
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.themeController}) : super(key: key);
  final ThemeController themeController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DemoProvider>(context)
        .setThemeController(widget.themeController);
    return AnimatedBuilder(
      animation: widget.themeController,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'Flutter Demo',
          locale: Provider.of<DemoProvider>(context).locale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: L10n.all,
          theme: FlexThemeData.light(
            colors: AppColor.schemes[widget.themeController.schemeIndex].light,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 5,
            appBarElevation: 0.5,
            useSubThemes: widget.themeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          darkTheme: FlexThemeData.dark(
            colors: AppColor.schemes[widget.themeController.schemeIndex].dark,
            surfaceMode: FlexSurfaceMode.highScaffoldLowSurfaces,
            blendLevel: 7,
            appBarElevation: 0.5,
            useSubThemes: widget.themeController.useSubThemes,
            visualDensity: AppData.visualDensity,
            fontFamily: AppData.font,
          ),
          themeMode: widget.themeController.themeMode,
          home: LoginScreen(
            controller: widget.themeController,
          ),
        );
      },
    );
  }
}
