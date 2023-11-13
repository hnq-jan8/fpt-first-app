import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/avatar/gradient_circle_avatar.dart';

class HomeAppBar extends StatefulWidget {
  final Color backgroundColor;
  final Color searchTextColor;
  final Color searchBorderColor;

  const HomeAppBar({
    super.key,
    this.backgroundColor = Colors.transparent,
    this.searchTextColor = ThemeColors.onPrimary,
    this.searchBorderColor = ThemeColors.onPrimary,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top;

    return SizedBox(
      height: 56 + topPadding,
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: widget.backgroundColor,
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
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  style: const TextStyle(
                    fontSize: 13.6,
                    color: ThemeColors.onBackground,
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
                          : widget.searchTextColor,
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
                      borderSide: BorderSide(
                        width: 2,
                        color: widget.searchBorderColor,
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
