import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/settings/widgets/app_icon.dart';
import 'package:next_app/widgets/buttons/cell_button.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/header/header.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: Header(
        title: StringConst.get(context)!.thongTinUngDung,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 120 + bottomPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 20),
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppIcon(),
                    SizedBox(height: 12),
                    Text('Phiên bản 1.0.23 build ABCDE'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1, top: 25),
                child: Text(
                  StringConst.get(context)!.them,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              CellButton(
                svgIconPath: Assets.icon_like,
                title: StringConst.get(context)!.danhGiaUngDung,
                onPressed: () {},
              ),
              CellButton(
                svgIconPath: Assets.icon_share,
                title: StringConst.get(context)!.chiaSeChoBanBe,
                onPressed: () {},
              ),
              CellButton(
                svgIconPath: Assets.icon_link,
                title: StringConst.get(context)!.truyCapWebsite,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
