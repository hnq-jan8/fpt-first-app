import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/main.dart';
import 'package:next_app/router.dart';
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
    isUsingVi = StringConst.get(context)!.localeName == 'vi';

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
                title: StringConst.get(context)!.ngonNguLanguage,
                switchText: StringConst.get(context)!.vi,
                switchTextOff: StringConst.get(context)!.en,
                isColorUpdate: false,
                value: isUsingVi,
                onChanged: (value) {
                  MyApp.setLocale(
                    context,
                    value ? const Locale('vi') : const Locale('en'),
                  );
                  setState(() => isUsingVi = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_notification_outlined,
                title: StringConst.get(context)!.thongBao,
                value: isUsingNotification,
                onChanged: (value) {
                  setState(() => isUsingNotification = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_face_id,
                title: StringConst.get(context)!.dangNhapXacThucBangKhuonMat,
                value: isUsingFaceId,
                onChanged: (value) {
                  setState(() => isUsingFaceId = value);
                },
              ),
              SettingCellSwitch(
                svgAsset: Assets.icon_otp,
                title: StringConst.get(context)!.smartOtp,
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
                child: Text(
                  StringConst.get(context)!.khac,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.get(context)!.thongTinUngDung,
                onPressed: () {},
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.get(context)!.chinhSachQuyenRiengTu,
                onPressed: () {
                  AppRouter.instance.navigateTo(Routes.policy);
                },
              ),
              SettingCellOther(
                svgIconPath: Assets.icon_info,
                title: StringConst.get(context)!.dieuKhoanSuDung,
                onPressed: () {},
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 160),
                    child: AppButton(
                      onPressed: () {},
                      color: ThemeColors.primaryBlue,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AppButtonText(
                          title: StringConst.get(context)!.thoatTaiKhoan,
                        ),
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
