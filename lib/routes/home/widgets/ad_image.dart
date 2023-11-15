import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class AdImage extends StatelessWidget {
  const AdImage({
    super.key,
    required this.image,
    required this.onPressed,
  });

  final String image;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.transparent,
          ),
          overlayColor: MaterialStateProperty.all(
            ThemeColors.onBackground,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            image,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
