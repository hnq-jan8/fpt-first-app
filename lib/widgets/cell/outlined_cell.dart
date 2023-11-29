import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class OutlinedCell extends StatefulWidget {
  const OutlinedCell({
    super.key,
    this.child,
    this.horizontalPadding = 15,
    this.onPressed,
    this.onTapDown,
    this.onTapUp,
  });

  final double horizontalPadding;

  final Widget? child;

  final VoidCallback? onPressed;

  final Function(TapDownDetails)? onTapDown;
  final Function(TapUpDetails)? onTapUp;

  @override
  State<OutlinedCell> createState() => _OutlinedCellState();
}

class _OutlinedCellState extends State<OutlinedCell> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
      child: Container(
        decoration: BoxDecoration(
          color: isPressed ? const Color(0xFFE7E7E7) : const Color(0xFFFFFFFF),
          border: Border.all(
            color: ThemeColors.fieldBorderDark,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPadding,
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
