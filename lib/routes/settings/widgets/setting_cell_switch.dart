import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:next_app/widgets/cell/outlined_cell.dart';
import 'package:next_app/widgets/switch/app_switch.dart';

class SettingCellSwitch extends StatelessWidget {
  const SettingCellSwitch({
    super.key,
    required this.svgAsset,
    required this.title,
    required this.value,
    required this.onChanged,
    this.switchText,
    this.switchTextOff,
    this.isColorUpdate = true,
    this.minHeight = 55,
  });

  final String svgAsset;
  final String title;

  final String? switchText;
  final String? switchTextOff;

  final bool value;
  final bool isColorUpdate;

  final double minHeight;

  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: minHeight),
      margin: const EdgeInsets.only(top: 15),
      child: OutlinedCell(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SvgPicture.asset(svgAsset, width: 20),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AppSwitch(
                value: value,
                isColorUpdate: isColorUpdate,
                text: switchText,
                textOff: switchTextOff,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
