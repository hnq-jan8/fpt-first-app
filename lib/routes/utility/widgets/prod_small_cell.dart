import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class ProductSmallerCell extends StatelessWidget {
  const ProductSmallerCell({
    super.key,
    required this.feature,
    this.textColor = ThemeColors.onPrimary,
    this.fillColor = ThemeColors.primary,
    this.borderColor,
  });

  final String feature;

  final Color textColor;
  final Color fillColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 7,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(7),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
              )
            : null,
      ),
      child: Center(
        child: Text(
          feature,
          style: TextStyle(
            fontSize: 11,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
