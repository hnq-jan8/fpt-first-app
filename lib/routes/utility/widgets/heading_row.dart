import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class HeadingRow extends StatelessWidget {
  const HeadingRow({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 1,
                right: 56,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.32,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            style: const ButtonStyle(
              splashFactory: NoSplash.splashFactory,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  StringConst.get(context)!.xemThem,
                  style: const TextStyle(
                    fontSize: 13.2,
                    height: 1.1,
                  ),
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  Assets.icon_next_dark,
                  height: 20,
                  colorFilter: const ColorFilter.mode(
                    ThemeColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
