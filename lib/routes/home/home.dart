import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/account/account_screen.dart';
import 'package:next_app/routes/help/help_screen.dart';
import 'package:next_app/routes/home/views/home_screen.dart';
import 'package:next_app/routes/settings/setting_screen.dart';
import 'package:next_app/widgets/navigation_bar/navigation_bar.dart';
import 'package:next_app/widgets/navigation_bar/navigation_bar_item.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<NavigationBarItem> navigationItems = [
      NavigationBarItem(
        activeIcon: SvgPicture.asset(Assets.icon_home_active),
        inactiveIcon: SvgPicture.asset(Assets.icon_home_inactive),
        title: StringConst.get(context)!.trangChu,
      ),
      NavigationBarItem(
        activeIcon: SvgPicture.asset(Assets.icon_help_active),
        inactiveIcon: SvgPicture.asset(Assets.icon_help_inactive),
        title: StringConst.get(context)!.troGiup,
      ),
      NavigationBarItem(
        activeIcon: SvgPicture.asset(Assets.icon_apps_active),
        inactiveIcon: SvgPicture.asset(Assets.icon_apps_inactive),
        title: StringConst.get(context)!.tienIch,
      ),
      NavigationBarItem(
        activeIcon: SvgPicture.asset(Assets.icon_settings_active),
        inactiveIcon: SvgPicture.asset(Assets.icon_settings_inactive),
        title: StringConst.get(context)!.caiDat,
      ),
      NavigationBarItem(
        activeIcon: SvgPicture.asset(Assets.icon_account_active),
        inactiveIcon: SvgPicture.asset(Assets.icon_account_inactive),
        title: StringConst.get(context)!.taiKhoan,
      )
    ];

    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return WillPopScope(
      onWillPop: _currentIndex != 0
          ? () {
              setState(() {
                _currentIndex = 0;
              });
              return Future.value(false);
            }
          : null,
      child: Material(
        color: ThemeColors.background,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: _currentIndex,
                    children: [
                      const HomeScreen(),
                      const HelpScreen(),
                      Container(color: Colors.green),
                      const SettingScreen(),
                      const AccountScreen(),
                    ],
                  ),
                ),
                Container(
                  color: const Color(0xFFFFFFFF),
                  height: 45 + bottomPadding,
                ),
              ],
            ),
            SafeArea(
              minimum: const EdgeInsets.only(bottom: 5),
              child: CustomBottomNavigationBar(
                onPressed: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: navigationItems,
                currentIndex: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
