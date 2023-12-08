import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/theme_colors.dart';

class RowIconText extends StatelessWidget {
  const RowIconText({
    super.key,
    required this.svgIcon,
    required this.text,
  });

  final String svgIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(svgIcon),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: ThemeColors.onPrimary,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
