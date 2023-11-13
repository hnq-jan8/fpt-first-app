import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class IndicatorDot extends StatelessWidget {
  const IndicatorDot({
    super.key,
    required this.relativePage,
    required this.currentPage,
    this.gradientColor1 = ThemeColors.indicatorGradient1,
    this.gradientColor2 = ThemeColors.indicatorGradient2,
    this.dimColor = ThemeColors.indicatorDim,
  });

  final int relativePage;
  final int currentPage;
  final Color gradientColor1;
  final Color gradientColor2;
  final Color dimColor;

  List<Color> get dimColors => <Color>[dimColor, dimColor];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: currentPage == relativePage
              ? <Color>[gradientColor1, gradientColor2]
              : dimColors,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
