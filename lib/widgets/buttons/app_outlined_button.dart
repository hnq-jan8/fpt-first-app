import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius = 10,
    this.color,
    this.height,
    this.width,
    this.horizontalPadding = 10,
    this.verticalPadding = 0,
  });

  final VoidCallback? onPressed;
  final Widget child;

  final Color? color;

  final double borderRadius;
  final double horizontalPadding;
  final double verticalPadding;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        animationDuration: const Duration(milliseconds: 0),
        fixedSize: MaterialStateProperty.all<Size>(
          Size(width ?? double.infinity, height ?? 10),
        ),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          ThemeColors.primaryBlue.withOpacity(0.25),
        ),
        splashFactory: NoSplash.splashFactory,
        elevation: MaterialStateProperty.all<double>(0),
        shape: MaterialStateProperty.all<OutlinedBorder?>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: color ?? ThemeColors.primary,
          ),
        ),
      ),
      child: child,
    );
  }
}
