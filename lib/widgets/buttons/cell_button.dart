import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/theme/assets.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';

class CellButton extends StatelessWidget {
  const CellButton({
    super.key,
    required this.svgIconPath,
    required this.title,
    required this.onPressed,
    this.minHeight = 55,
    this.maxLines,
  });

  final String svgIconPath;
  final String title;

  final VoidCallback? onPressed;

  final double minHeight;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      margin: const EdgeInsets.only(top: 15),
      child: OutlinedCell(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SvgPicture.asset(svgIconPath, width: 20),
            const SizedBox(width: 20),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  maxLines: maxLines,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 12,
                left: 18.5,
                right: 5,
              ),
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
