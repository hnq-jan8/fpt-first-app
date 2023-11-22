import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/settings/widgets/setting_cell_switch.dart';
import 'package:next_app/routes/settings/widgets/setting_cell_other.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_button.dart';
import 'package:next_app/widgets/buttons/app_button_text.dart';
import 'package:next_app/widgets/header/no_app_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  double topPadding = 15;
  double elevation = 0;

  bool isUsingVi = true;
  bool isUsingNotification = true;
  bool isUsingFaceId = true;
  bool isUsingOtp = false;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      scrollController.offset > topPadding + 15
          ? setState(() => elevation = 1)
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
              SettingCellSwitch(
                svgAsset: Assets.icon_globe,
                // title: StringConst.ngonNguLanguage,
                title: StringConst2.ngonNguLanguage[Language.vi].toString(),
                switchText: StringConst.vi,
                switchTextOff: StringConst.en,
                isColorUpdate: false,
                value: isUsingVi,
                onChanged: (value) {
                  setState(() => isUsingVi = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_notification_outlined,
                title: StringConst.thongBao,
                value: isUsingNotification,
                onChanged: (value) {
                  setState(() => isUsingNotification = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_face_id,
                title: StringConst.dangNhapXacThucBangKhuonMat,
                value: isUsingFaceId,
                onChanged: (value) {
                  setState(() => isUsingFaceId = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_otp,
                title: StringConst.smartOtp,
                value: isUsingOtp,
                onChanged: (value) {
                  setState(() => isUsingOtp = value);
                },
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
              const SizedBox(height: 125),
            ],
          ),
        ),
      ),
    );
  }
}
