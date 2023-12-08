import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class NavigationBarIndicator extends StatelessWidget {
  const NavigationBarIndicator({
    super.key,
    required this.duration,
    required this.itemWidth,
    required this.currentIndex,
    required this.indicatorHeight,
    this.curve = Curves.easeOut,
    this.activeColor = ThemeColors.primary,
    this.indicatorPadding = 10,
  });

  final Duration duration;

  final double itemWidth;
  final double indicatorHeight;
  final double indicatorPadding;

  final int currentIndex;

  final Curve curve;

  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: indicatorHeight,
        ),
        AnimatedPositioned(
          duration: duration,
          curve: curve,
          left: itemWidth * currentIndex,
          child: SizedBox(
            width: itemWidth,
            child: Container(
              height: indicatorHeight,
              margin: EdgeInsets.symmetric(horizontal: indicatorPadding),
              decoration: BoxDecoration(
                color: activeColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
