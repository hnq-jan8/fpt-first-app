import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/widgets/cell/cell.dart';

class IconCell extends StatelessWidget {
  const IconCell(
    this.icon, {
    super.key,
    this.padding = 10,
    required this.onPressed,
  });

  final double padding;

  final String icon;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Cell(
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
