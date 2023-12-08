import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:next_app/theme/theme_colors.dart';

class BlurHeader extends StatelessWidget implements PreferredSizeWidget {
  final Brightness statusBarIconBrightness;

  final double? sigmaValue;

  final Color backgroundColor;

  final Widget? title;

  const BlurHeader({
    super.key,
    this.statusBarIconBrightness = Brightness.dark,
    this.sigmaValue,
    this.backgroundColor = ThemeColors.homeHeader,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: statusBarIconBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        statusBarIconBrightness: statusBarIconBrightness,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: const Color(0xFFFFFFFF),
      ),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaValue ?? 12,
            sigmaY: sigmaValue ?? 12,
          ), //
          child: Container(
            color: backgroundColor,
          ),
        ),
      ),
      elevation: 0,
      title: title,
    );
  }
}
