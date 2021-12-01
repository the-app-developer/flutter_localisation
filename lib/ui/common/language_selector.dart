import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:demo_localisation/constant/app_assets.dart';
import 'package:demo_localisation/constant/app_colors.dart';
import 'package:demo_localisation/constant/constant.dart';
import 'package:demo_localisation/constant/strings.dart';
import 'package:demo_localisation/utility/utils.dart';

class LanguageSelector extends StatefulWidget {
  final BuildContext mainContext;
  LanguageSelector({
    Key? key,
    required this.mainContext,
  }) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = Utils.getISOCodeFromLng(
        AppLocalizations.of(widget.mainContext)!.isocode);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

      // dropdown below..
      child: DropdownButton<String>(
          value: dropdownValue,
          icon: Image.asset(
            AppAssets.downArrowIcon,
          ),
          style: const TextStyle(
              fontFamily: Strings.robotoBold,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.primaryColor),
          iconSize: 42,
          underline: SizedBox(),
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
              String languageIso = "en";
              languageIso = Utils.getLngFromISOCode(value);
              updateLanguage(Locale(languageIso), widget.mainContext);
            });
          },
          items:
              Utils.getLangList().map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList()),
    ).h(35);
  }
}
