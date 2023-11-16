import 'package:flutter/material.dart';
import 'package:next_app/routes/home/widgets/row_content_button.dart';
import 'package:next_app/theme/theme_colors.dart';

class HomeGradientContentBox extends StatelessWidget {
  const HomeGradientContentBox({
    super.key,
    this.gradientColor1 = ThemeColors.headerGradient1,
    this.gradientColor2 = ThemeColors.headerGradient2,
    this.topCornerRadius = 15,
    required this.title1,
    required this.content1,
    required this.buttonTitle1,
    required this.title2,
    required this.content2,
    required this.buttonTitle2,
    required this.onPressed1,
    required this.onPressed2,
  });

  final Color gradientColor1;
  final Color gradientColor2;

  final double topCornerRadius;

  final String title1;
  final String content1;
  final String buttonTitle1;

  final String title2;
  final String content2;
  final String buttonTitle2;

  final VoidCallback? onPressed1;
  final VoidCallback? onPressed2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 15,
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(topCornerRadius),
        ),
        gradient: LinearGradient(
          colors: [gradientColor1, gradientColor2],
        ),
      ),
      child: Column(
        children: [
          RowContentButton(
            title: title1,
            content: content1,
            buttonTitle: buttonTitle1,
            onPressed: onPressed1,
          ),
          const SizedBox(height: 12),
          RowContentButton(
            title: title2,
            content: content2,
            buttonTitle: buttonTitle2,
            onPressed: onPressed2,
          ),
        ],
      ),
    );
  }
}
