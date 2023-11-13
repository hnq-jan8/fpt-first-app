import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class GradientCircleAvatar extends StatelessWidget {
  const GradientCircleAvatar({
    super.key,
    this.radius = 21,
  });

  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: <Color>[
            ThemeColors.indicatorGradient1,
            ThemeColors.indicatorGradient2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: CircleAvatar(
        radius: radius,
        backgroundColor: ThemeColors.background,
        // backgroundImage: AssetImage(Assets.image_logo),
      ),
    );
  }
}
