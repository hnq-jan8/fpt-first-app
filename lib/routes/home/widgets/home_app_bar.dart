import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/avatar/gradient_circle_avatar.dart';

class HomeAppBar extends StatefulWidget {
  final Color backgroundColor;
  final Color searchTextColor;
  final Color searchBorderColor;

  final double sigmaValue;

  final Brightness statusBarIconBrightness;

  const HomeAppBar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.searchTextColor = ThemeColors.onPrimary,
    this.searchBorderColor = ThemeColors.onPrimary,
    this.sigmaValue = 0,
    this.statusBarIconBrightness = Brightness.dark,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final FocusNode _searchFocusNode = FocusNode();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: 60 + topPadding,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: widget.statusBarIconBrightness,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: const Color(0xFFFFFFFF),
        ),
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: widget.sigmaValue,
              sigmaY: widget.sigmaValue,
            ), //
            child: Container(
              color: widget.backgroundColor,
            ),
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            const GradientCircleAvatar(),
            const SizedBox(width: 15),
            Expanded(
              child: SizedBox(
                height: 36,
                child: TextField(
                  focusNode: _searchFocusNode,
                  controller: _searchController,
                  onTap: () => _searchController.selection = TextSelection(
                    baseOffset: 0,
                    extentOffset: _searchController.text.length,
                  ),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: TextStyle(
                    fontSize: 13.6,
                    color: _searchFocusNode.hasFocus
                        ? ThemeColors.onBackground
                        : widget.searchTextColor,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: _searchFocusNode.hasFocus
                        ? ThemeColors.background
                        : Colors.transparent,
                    contentPadding: EdgeInsets.zero,
                    hintText: StringConst.timKiem,
                    hintStyle: TextStyle(
                      fontSize: 13.6,
                      color: _searchFocusNode.hasFocus
                          ? ThemeColors.onBackground.withOpacity(0.5)
                          : widget.searchTextColor.withOpacity(0.7),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: _searchFocusNode.hasFocus
                          ? ThemeColors.onBackground
                          : widget.searchTextColor,
                      size: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide(
                        width: 2,
                        color: widget.searchBorderColor.withOpacity(0.5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        width: 1,
                        color: ThemeColors.background,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {},
              alignment: Alignment.centerRight,
              splashColor: Colors.transparent,
              splashRadius: 0.1,
              icon: SvgPicture.asset(
                Assets.icon_notification,
                height: 25,
                colorFilter: const ColorFilter.mode(
                  ThemeColors.primaryBlue,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
