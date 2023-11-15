import 'package:flutter/material.dart';

import 'package:next_app/theme/assets.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int cacheHeight = MediaQuery.of(context).size.height.toInt();
    int cacheWidth = MediaQuery.of(context).size.width.toInt();

    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: Image.asset(
        Assets.image_home_bg,
        cacheHeight: cacheWidth,
        cacheWidth: cacheHeight,
      ),
    );
  }
}
