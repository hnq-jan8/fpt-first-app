import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    this.width = 64,
    this.height = 47,
    this.borderRadius = 10,
    this.fillColor = const Color(0xFFFFFFFF),
    required this.child,
  });

  final double borderRadius;
  final double width;
  final double height;

  final Color fillColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
