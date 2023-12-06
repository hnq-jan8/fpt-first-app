import 'package:flutter/material.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class GradientCircleAvatar extends StatelessWidget {
  const GradientCircleAvatar({
    super.key,
    this.radius,
  });

  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: <Color>[
            ThemeColors.indicatorGradient1,
            ThemeColors.indicatorGradient2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CircleAvatar(
        radius: radius ?? 21,
        backgroundColor: ThemeColors.background,
        backgroundImage: Image.asset(
          Assets.image_avatar_default,
          cacheHeight: 147,
          cacheWidth: 147,
        ).image,
      ),
    );
  }
}
