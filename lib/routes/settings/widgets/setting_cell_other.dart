import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';

class SettingCellOther extends StatelessWidget {
  const SettingCellOther({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.onPressed,
  });

  final String svgIconPath;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: const EdgeInsets.only(top: 15),
      child: OutlinedCell(
        onPressed: onPressed,
        horizontalPadding: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(svgIconPath, width: 20),
                const SizedBox(width: 20),
                Text(title),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                Assets.icon_next_dark,
                width: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
