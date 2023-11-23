import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/router.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final Widget? widgets;
  final List<Widget>? actions;

  final String? title;

  final double? height;
  final double elevation;

  final bool? showBack;
  final bool useGradient;

  final VoidCallback? onBack;

  final bool centerTitle;

  const Header({
    Key? key,
    this.leading,
    this.title,
    this.widgets,
    this.actions,
    this.onBack,
    this.showBack = true,
    this.height,
    this.elevation = 0,
    this.useGradient = true,
    this.centerTitle = false,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: height ?? kToolbarHeight,
      automaticallyImplyLeading: showBack!,
      actions: actions,
      elevation: elevation,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: !useGradient ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            useGradient ? Brightness.light : Brightness.dark,
        systemNavigationBarColor: ThemeColors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      leading: showBack!
          ? (leading ??
              IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onBack ?? () => AppRouter.instance.pop(),
                icon: SvgPicture.asset(
                  useGradient
                      ? Assets.icon_return_light
                      : Assets.icon_return_dark,
                ),
              ))
          : null,
      flexibleSpace: useGradient
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.headerGradient1,
                    ThemeColors.headerGradient2,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            )
          : null,
      title: widgets ??
          Text(
            title ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: useGradient ? Colors.white : ThemeColors.onBackground,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
      centerTitle: title != null ? true : centerTitle,
    );
  }
}
