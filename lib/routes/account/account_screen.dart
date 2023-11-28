import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/home/widgets/home_background.dart';
import 'package:next_app/widgets/buttons/cell_button.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/avatar/gradient_circle_avatar.dart';
import 'package:next_app/widgets/buttons/app_button.dart';
import 'package:next_app/widgets/buttons/app_button_text.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/header/blur_header.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>
    with TickerProviderStateMixin {
  double statusBarOpacity = 0;

  double backgroundOpacity = 1;
  double backgroundHeight = 5;

  double sigmaValue = 0;

  Brightness statusBarIconBrightness = Brightness.light;

  final String username = 'Nguyễn Văn A';
  final String phoneNumber = '0987654321';

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (info) {
        if (info.metrics.axis == Axis.vertical) {
          setState(() {
            statusBarOpacity = info.metrics.pixels > 65
                ? ((info.metrics.pixels - 65) / 25).clamp(0, 0.64)
                : 0;
            sigmaValue = 0.4 * info.metrics.pixels.abs().clamp(0, 32);

            statusBarIconBrightness =
                info.metrics.pixels > 65 ? Brightness.dark : Brightness.light;

            backgroundOpacity = (1 + info.metrics.pixels / 25).clamp(0, 1);
            backgroundHeight = info.metrics.pixels > 0
                ? 5
                : (-1.05 * info.metrics.pixels).clamp(5, double.infinity);
          });
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        extendBodyBehindAppBar: true,
        appBar: BlurHeader(
          backgroundColor: ThemeColors.homeHeader.withOpacity(statusBarOpacity),
          sigmaValue: sigmaValue,
          statusBarIconBrightness: statusBarIconBrightness,
        ),
        body: Stack(
          children: [
            Container(
              height: backgroundHeight,
              width: double.infinity,
              color: ThemeColors.backgroundMedium,
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  HomeBackground(
                    imageOpacity: backgroundOpacity,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 20,
                      left: 20,
                      right: 20,
                      bottom: 70,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 47),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 17.5,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 2.5),
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 49),
                                  Text(
                                    StringConst.get(context)!
                                        .xinChaoUser(username),
                                    style: const TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    phoneNumber,
                                    style: const TextStyle(
                                      height: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 11.5),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GradientButton(
                                          onPressed: () {},
                                          reversedBehavior: true,
                                          child: AppButtonText(
                                              title: StringConst.get(context)!
                                                  .xacThucTaiKhoan),
                                        ),
                                      ),
                                      const SizedBox(width: 13.7),
                                      Expanded(
                                        child: AppButton(
                                          onPressed: () {},
                                          height: 45,
                                          color: ThemeColors.primaryBlue,
                                          child: AppButtonText(
                                            title: StringConst.get(context)!
                                                .thongTinChung,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const GradientCircleAvatar(radius: 45),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 1,
                            top: 30,
                          ),
                          child: Text(
                            StringConst.get(context)!.quanLyThueBao,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_history,
                          title: StringConst.get(context)!.lichSuThanhToan,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_cart,
                          title: StringConst.get(context)!.theoDoiDonHang,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_block_call,
                          title: StringConst.get(context)!.chanCuocGoi,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_wallet,
                          title:
                              StringConst.get(context)!.quanLyThongTinThanhToan,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_lock,
                          title: StringConst.get(context)!.doiMatKhau,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_scan_qr,
                          title: StringConst.get(context)!.quetMaQr,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_members,
                          title: StringConst.get(context)!.hoiVien,
                          onPressed: () {},
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
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
                        CellButton(
                          svgIconPath: Assets.icon_security,
                          title: StringConst.get(context)!.trungTamBaoMat,
                          onPressed: () {},
                        ),
                        CellButton(
                          svgIconPath: Assets.icon_gift,
                          title: StringConst.get(context)!.khuyenMaiVaQuaTang,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
