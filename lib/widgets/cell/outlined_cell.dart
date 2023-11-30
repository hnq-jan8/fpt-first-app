import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class OutlinedCell extends StatefulWidget {
  const OutlinedCell({
    super.key,
    this.child,
    this.onPressed,
    this.onTapDown,
    this.onTapUp,
    this.width,
    this.height,
    this.margin,
    this.padding,
  });

  final double? width;
  final double? height;

  final Widget? child;

  final VoidCallback? onPressed;

  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;

  @override
  State<OutlinedCell> createState() => _OutlinedCellState();
}

class _OutlinedCellState extends State<OutlinedCell> {
  bool isPressed = false;

  Container content() {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: isPressed ? const Color(0xFFE7E7E7) : const Color(0xFFFFFFFF),
        border: Border.all(
          color: ThemeColors.fieldBorderDark,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: widget.child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPressed == null
        ? content()
        : GestureDetector(
            onTap: widget.onPressed,
            onTapDown: (details) {
              if (widget.onPressed != null) {
                setState(() {
                  isPressed = true;
                });
              }

              if (widget.onTapDown != null) {
                widget.onTapDown!(details);
              }
            },
            onTapUp: (details) {
              setState(() {
                isPressed = false;
              });
              if (widget.onTapUp != null) {
                widget.onTapUp!(details);
              }
            },
            onTapCancel: () {
              setState(() {
                isPressed = false;
              });
            },
            child: content(),
          );
  }
}
