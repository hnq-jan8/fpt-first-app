import 'package:flutter/material.dart';

class GradientButtonTitle extends StatelessWidget {
  const GradientButtonTitle({
    super.key,
    required this.buttonTitle,
  });

  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      buttonTitle,
      style: const TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
