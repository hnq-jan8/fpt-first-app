import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/theme_colors.dart';

class GradientColumnButton extends StatefulWidget {
  const GradientColumnButton({
    super.key,
    required this.title,
    required this.svgAsset,
    required this.onPressed,
  });

  final String title;
  final String svgAsset;

  final VoidCallback? onPressed;

  @override
  State<GradientColumnButton> createState() => _GradientColumnButtonState();
}

class _GradientColumnButtonState extends State<GradientColumnButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      onTapDown: (details) => setState(() => isPressed = true),
      onTapCancel: () => setState(() => isPressed = false),
      onTapUp: (details) => setState(() => isPressed = false),
      child: Container(
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.only(
          top: 15,
          left: 5,
          right: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: <Color>[
              ThemeColors.buttonGradient1,
              ThemeColors.buttonGradient2,
            ],
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color:
                isPressed ? const Color(0xEDFFFFFF) : const Color(0xFFFFFFFF),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: SvgPicture.asset(
                  widget.svgAsset,
                ),
              ),
              const SizedBox(height: 5),
              ShaderMask(
                shaderCallback: (Rect bounds) => const LinearGradient(
                  colors: <Color>[
                    ThemeColors.textGradient1,
                    ThemeColors.textGradient2,
                  ],
                ).createShader(bounds),
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
