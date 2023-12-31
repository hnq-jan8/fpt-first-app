import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/theme_colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.svgIcon,
    required this.title,
    required this.onPressed,
  });

  final String svgIcon;
  final String title;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.all(
          Colors.black12,
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) => const RoundedRectangleBorder(),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(0),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: SvgPicture.asset(
              svgIcon,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ThemeColors.onBackground,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
