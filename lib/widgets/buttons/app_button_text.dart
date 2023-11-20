import 'package:flutter/material.dart';
import 'package:next_app/theme/theme_colors.dart';

class AppButtonText extends StatelessWidget {
  const AppButtonText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: ThemeColors.onPrimary,
        fontSize: 13.5,
      ),
    );
  }
}
