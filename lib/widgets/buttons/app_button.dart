import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 15,
    this.color,
    this.height = 50,
  });

  final VoidCallback? onPressed;
  final Widget child;

  final Color? color;

  final double borderRadius;
  final double height;

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
           Size(double.infinity, height),
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
