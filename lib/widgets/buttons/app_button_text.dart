import 'package:flutter/material.dart';

class AppButtonText extends StatelessWidget {
  const AppButtonText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 13.5,
      ),
    );
  }
}
