import 'package:flutter/material.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
    this.imageOpacity = 1,
  });

  final double imageOpacity;

  @override
  Widget build(BuildContext context) {
    int cacheHeight = MediaQuery.of(context).size.height ~/ 2;
    int cacheWidth = MediaQuery.of(context).size.width ~/ 2;

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        color: ThemeColors.backgroundMedium,
      ),
      child: Opacity(
        opacity: imageOpacity,
        child: Image.asset(
          Assets.image_home_bg,
          cacheHeight: cacheWidth,
          cacheWidth: cacheHeight,
        ),
      ),
    );
  }
}
