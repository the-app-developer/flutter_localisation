import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../shared/const/app_color.dart';


class ThemePopupMenu extends StatelessWidget {
  const ThemePopupMenu({
    Key? key,
    required this.schemeIndex,
    required this.onChanged,
    this.contentPadding,
  }) : super(key: key);
  final int schemeIndex;
  final ValueChanged<int> onChanged;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme colorScheme = theme.colorScheme;

    return Container(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, crossAxisSpacing: 0, mainAxisSpacing: 0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onChanged.call(index);
            },
            child: Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Icon(
                      Icons.lens,
                      color: isLight
                          ? AppColor.schemes[index].light.primary
                          : AppColor.schemes[index].dark.primary,
                      size: 90,
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.transparent),
                  ),
                  if (index == schemeIndex)
                    Container(
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      ),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.transparent),
                    ),
                ],
              ),
            ).centered(),
          );
        },
        itemCount: AppColor.schemes.length,
      ).expand(),
    );
  
  }
}
