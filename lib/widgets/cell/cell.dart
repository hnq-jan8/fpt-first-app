import 'package:flutter/material.dart';

class Cell extends StatefulWidget {
  const Cell({
    super.key,
    this.width = 64,
    this.height = 47,
    this.borderRadius = 10,
    this.fillColor = const Color(0xFFFFFFFF),
    required this.child,
    this.borderColor,
    this.onPressed,
  });

  final double borderRadius;
  final double width;
  final double height;

  final Color fillColor;
  final Color? borderColor;

  final Widget? child;

  final VoidCallback? onPressed;

  @override
  State<Cell> createState() => _CellState();
}

class _CellState extends State<Cell> {
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
      },
      onTapUp: (details) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isPressed ? const Color(0xFFE7E7E7) : widget.fillColor,
          borderRadius: BorderRadius.circular(widget.borderRadius),
          border: widget.borderColor != null
              ? Border.all(
                  color: widget.borderColor!,
                  width: 1,
                )
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}
