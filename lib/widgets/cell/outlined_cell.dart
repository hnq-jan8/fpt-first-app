import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class OutlinedCell extends StatelessWidget {
  const OutlinedCell({
    super.key,
    this.child,
    this.onPressed,
    this.horizontalPadding = 15,
    this.onTapDown,
    this.onTapUp,
  });

  final double horizontalPadding;

  final Widget? child;

  final VoidCallback? onPressed;

  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: ThemeColors.fieldBorderDark,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onPressed,
        onTapDown: onTapDown,
        onTapUp: onTapUp,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
