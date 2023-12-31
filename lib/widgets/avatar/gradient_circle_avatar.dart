import 'package:flutter/material.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class GradientCircleAvatar extends StatelessWidget {
  const GradientCircleAvatar({
    super.key,
    this.radius,
    this.onPressed,
  });

  final double? radius;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
            fit: BoxFit.cover,
          ).image,
        ),
      ),
    );
  }
}
