import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class GradientButton extends StatefulWidget {
  final Color backgroundColor;

  final Color gradientColor1;
  final Color gradientColor2;

  final Color textGradientColor1;
  final Color textGradientColor2;

  final Widget child;

  final VoidCallback? onPressed;

  final double borderRadius;
  final double? horizontalPadding;

  /// Reverse the way this button updates its color
  final bool reversedBehavior;

  const GradientButton({
    Key? key,
    this.gradientColor1 = ThemeColors.buttonGradient1,
    this.gradientColor2 = ThemeColors.buttonGradient2,
    this.textGradientColor1 = ThemeColors.textGradient1,
    this.textGradientColor2 = ThemeColors.textGradient2,
    this.backgroundColor = ThemeColors.background,
    this.borderRadius = 14,
    required this.child,
    required this.onPressed,
    this.reversedBehavior = false,
    this.horizontalPadding,
  }) : super(key: key);

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => setState(() => isButtonPressed = true),
      onTapCancel: () => setState(() => isButtonPressed = false),
      onTapUp: (details) => setState(() => isButtonPressed = false),
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(1),
          height: 45,
          constraints: const BoxConstraints(minWidth: 160),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius + 1),
            gradient: LinearGradient(
              colors: <Color>[
                widget.gradientColor1,
                widget.gradientColor2,
              ],
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding ?? widget.borderRadius,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              color: isButtonPressed != widget.reversedBehavior
                  ? Colors.transparent
                  : widget.backgroundColor,
            ),
            child: ShaderMask(
              shaderCallback: (Rect bounds) => LinearGradient(
                colors: isButtonPressed != widget.reversedBehavior
                    ? <Color>[
                        const Color(0xFFFFFFFF),
                        const Color(0xFFFFFFFF),
                      ]
                    : <Color>[
                        widget.textGradientColor1,
                        widget.textGradientColor2,
                      ],
              ).createShader(bounds),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
