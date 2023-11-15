import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    this.width = 64,
    this.height = 47,
    this.borderRadius = 10,
    this.fillColor = const Color(0xFFFFFFFF),
    required this.child,
    this.borderColor,
  });

  final double borderRadius;
  final double width;
  final double height;

  final Color fillColor;
  final Color? borderColor;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: 1,
              )
            : null,
      ),
      child: child,
    );
  }
}
