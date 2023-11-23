import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:next_app/theme/theme_colors.dart';

class NoAppBar extends StatelessWidget implements PreferredSizeWidget {
  ///
  /// Correct system_status_bar_icon color
  const NoAppBar({
    super.key,
    this.elevation = 0,
  });

  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      toolbarHeight: 0,
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.background,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Color(0xFFFFFFFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
