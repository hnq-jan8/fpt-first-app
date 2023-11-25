import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BlurHeader extends StatelessWidget implements PreferredSizeWidget {
  final Brightness? statusBarIconBrightness;

  final double? sigmaValue;

  final Color backgroundColor;

  final Widget? title;

  const BlurHeader({
    super.key,
    this.statusBarIconBrightness,
    this.sigmaValue,
    required this.backgroundColor,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: statusBarIconBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: const Color(0xFFFFFFFF),
      ),
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaValue ?? 10,
            sigmaY: sigmaValue ?? 10,
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
