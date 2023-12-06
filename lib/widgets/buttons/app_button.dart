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
    this.width,
    this.horizontalPadding = 10,
    this.verticalPadding = 0,
  });

  final VoidCallback? onPressed;
  final Widget child;

  final Color? color;

  final double borderRadius;
  final double height;
  final double horizontalPadding;
  final double verticalPadding;

  final double? width;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          color ?? ThemeColors.primary,
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          const Color(0x50E5E5E5),
        ),
        animationDuration: const Duration(milliseconds: 0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(width ?? double.infinity, height),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        splashFactory: NoSplash.splashFactory,
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
