import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/theme_colors.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.svgIcon,
    required this.title,
  });

  final String svgIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        debugPrint(svgIcon);
      },
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        splashFactory: NoSplash.splashFactory,
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        overlayColor: MaterialStateProperty.all(
          ThemeColors.primaryBlue.withOpacity(0.1),
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
            ),
          ),
        ],
      ),
    );
  }
}
