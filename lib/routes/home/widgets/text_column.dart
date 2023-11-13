import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class TextColumn extends StatelessWidget {
  const TextColumn({
    super.key,
    required this.title,
    required this.content,
    this.fontSize = 13.2,
  });

  final String title;
  final String content;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            color: ThemeColors.onPrimary,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          content,
          style: TextStyle(
            fontSize: fontSize,
            color: ThemeColors.onPrimary,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
