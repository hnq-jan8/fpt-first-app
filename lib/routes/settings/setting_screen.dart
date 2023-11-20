import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/settings/widgets/setting_cell_other.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_button.dart';
import 'package:next_app/widgets/buttons/app_button_text.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';
import 'package:next_app/widgets/header/no_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double topPadding = 15;
  double elevation = 0;

  bool switchTest = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      scrollController.offset > topPadding + 15
          ? setState(() => elevation = 0.5)
          : setState(() => elevation = 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: NoAppBar(elevation: elevation),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: topPadding),
              Container(
                height: 55,
                margin: const EdgeInsets.only(top: 15),
                child: OutlinedCell(
                  horizontalPadding: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Assets.icon_globe, width: 20),
                          const SizedBox(width: 20),
                          const Text('Ngôn ngữ/Language'),
                        ],
                      ),
                      Switch(
                        value: switchTest,
                        onChanged: (value) {
                          setState(() => switchTest = value);
                        },
                      ), // TODO: Custom Switch
                      Container(
                        height: 19,
                        width: 48,
                        decoration: BoxDecoration(
                          color: ThemeColors.scrollIndicator,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 0,
                              // width: 48 - 23,
                            ),
                            Container(
                              width: 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(colors: [
                                  ThemeColors.indicatorGradient1,
                                  ThemeColors.indicatorGradient2,
                                ]),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 1,
                  top: 30,
                ),
                child: const Text(
                  StringConst.khac,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.thongTinUngDung,
                onPressed: () {},
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.chinhSachQuyenRiengTu,
                onPressed: () {},
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.dieuKhoanSuDung,
                onPressed: () {},
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: AppButton(
                    onPressed: () {},
                    color: ThemeColors.primaryBlue,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: AppButtonText(
                        title: StringConst.thoatTaiKhoan,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 500),
            ],
          ),
        ),
      ),
    );
  }
}
