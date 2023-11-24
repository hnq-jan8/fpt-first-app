import 'package:flutter/material.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    this.appIconBorderRadius,
  });

  final double? appIconBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: ThemeColors.fieldBorder,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(appIconBorderRadius ?? 15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(appIconBorderRadius ?? 15),
        child: Image.asset(
          Assets.image_app_icon,
          width: 55,
          height: 55,
          cacheHeight: 110,
          cacheWidth: 110,
        ),
      ),
    );
  }
}