import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/avatar/gradient_circle_avatar.dart';
import 'package:next_app/widgets/header/blur_header.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final Color searchTextColor;
  final Color searchBorderColor;

  final double sigmaValue;

  final Brightness statusBarIconBrightness;

  final int notifUnreadCount;

  final double? avatarRadius;

  final Listenable animationController;

  const HomeAppBar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.searchTextColor = ThemeColors.onPrimary,
    this.searchBorderColor = ThemeColors.onPrimary,
    this.sigmaValue = 0,
    this.statusBarIconBrightness = Brightness.dark,
    this.notifUnreadCount = 0,
    this.avatarRadius,
    required this.animationController,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
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
    return AnimatedBuilder(
        animation: widget.animationController,
        builder: (context, child) {
          return BlurHeader(
            statusBarIconBrightness: widget.statusBarIconBrightness,
            sigmaValue: widget.sigmaValue,
            backgroundColor: widget.backgroundColor,
            title: Row(
              children: [
                GradientCircleAvatar(radius: widget.avatarRadius),
                const SizedBox(width: 15),
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextField(
                      focusNode: _searchFocusNode,
                      controller: _searchController,
                      onTap: () =>
                          _searchController.selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _searchController.text.length,
                      ),
                      onTapOutside: (event) =>
                          FocusScope.of(context).unfocus(),
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
                            : const Color(0x12000000),
                        contentPadding: EdgeInsets.zero,
                        hintText: StringConst.get(context)!.timKiem,
                        hintStyle: TextStyle(
                          fontSize: 13.6,
                          fontWeight: FontWeight.w500,
                          color: _searchFocusNode.hasFocus
                              ? Colors.black45
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
                            width: 1.5,
                            color: widget.searchBorderColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            width: 0.4,
                            color: ThemeColors.dimText,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  splashColor: Colors.transparent,
                  splashRadius: 0.1,
                  icon: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(
                            Assets.icon_notification,
                            height: 25,
                            colorFilter: const ColorFilter.mode(
                              ThemeColors.primaryBlue,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: widget.notifUnreadCount != 0
                            ? Container(
                                constraints:
                                    const BoxConstraints(minWidth: 20),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: ThemeColors.primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.only(
                                    top: 2,
                                    bottom: 1,
                                    left: 3,
                                    right: 4,
                                  ),
                                  margin: const EdgeInsets.only(
                                    top: 7,
                                    right: 4,
                                  ),
                                  child: Text(
                                    widget.notifUnreadCount.toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontSize: 12.5,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
