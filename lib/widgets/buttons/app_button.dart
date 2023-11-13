import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 15,
    this.color,
  });

  final VoidCallback? onPressed;
  final Widget child;

  final Color? color;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? ThemeColors.primary,
        ),
        animationDuration: const Duration(milliseconds: 0),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(double.infinity, 50),
        ),
        splashFactory: NoSplash.splashFactory,
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<OutlinedBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
      child: child,
    );
  }
}
