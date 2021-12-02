import 'package:demo_localisation/constant/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget backgroundWidget(BuildContext context) {
  return Stack(
    children: [
      ColorFiltered(
        colorFilter: ColorFilter.mode(
            Theme.of(context).cardColor.withOpacity(0.6), BlendMode.color),
        child: Image.asset(
          AppAssets.bgImg,
          fit: BoxFit.cover,
          color: Theme.of(context).primaryColor,
        )
            .wh(MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height)
            .opacity(value: 0.4),
      ),
      Container(
        color: Theme.of(context).cardColor,
      ).opacity(value: 0.7),
    ],
  );
}
