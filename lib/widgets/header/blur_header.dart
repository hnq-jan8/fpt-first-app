import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlurHeader extends StatelessWidget implements PreferredSizeWidget {
  final Brightness statusBarIconBrightness;

  final double sigmaValue;

  final Color backgroundColor;

  final Widget? title;

  const BlurHeader({
    super.key,
    required this.statusBarIconBrightness,
    required this.sigmaValue,
    required this.backgroundColor,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            sigmaX: sigmaValue,
            sigmaY: sigmaValue,
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

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
