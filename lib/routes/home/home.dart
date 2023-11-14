import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/home/widgets/home_app_bar.dart';
import 'package:next_app/routes/home/widgets/home_background.dart';
import 'package:next_app/routes/home/widgets/menu_item.dart';
import 'package:next_app/routes/home/widgets/row_content_button.dart';
import 'package:next_app/routes/home/widgets/text_column.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/indicators/indicator_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Map<String, String> mainFeatures = {
    Assets.icon_call_history: StringConst.lichSuCuocGoi,
    Assets.icon_unlock: StringConst.moKhoaThueBao,
    Assets.icon_purchase_bills: StringConst.thanhToanHoaDon,
    Assets.icon_activate_sim: StringConst.kichHoatSim,
    Assets.icon_membership: StringConst.hoiVien,
    Assets.icon_purchase_sim: StringConst.muaSim,
    Assets.icon_personalize: StringConst.goiCuocCaNhanHoa,
    Assets.icon_transfer: StringConst.chuyenTien,
    Assets.icon_look_up: StringConst.traCuuThongTin,
    Assets.icon_vas_service: StringConst.dichVuVas,
  };

  late AnimationController _colorController;
  late AnimationController _backDropController;
  late Animation _colorTween;
  late Animation _colorTweenText;
  late Animation _colorTweenBorder;
  late Animation _backDropFilter;

  Brightness _iconBrightness = Brightness.light;

  double position = 0;

  final ScrollController _menuScrollController = ScrollController();

  bool _scrollListener(ScrollNotification info) {
    if (info.metrics.axis == Axis.vertical) {
      _colorController.animateTo(info.metrics.pixels.abs() * 2 / 100);
      _backDropController.animateTo(info.metrics.pixels * 2 / 100);
      _iconBrightness = info.metrics.pixels < 30 && info.metrics.pixels > -20
          ? Brightness.light
          : Brightness.dark;
    }
    return true;
  }

  @override
  void initState() {
    _menuScrollController.addListener(() {
      setState(() {});
    });

    // update scroll position for showing scroll indicator
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _menuScrollController.jumpTo(1);
      _menuScrollController.jumpTo(0);
    });

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    _backDropController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );

    _colorTween = ColorTween(
      begin: Colors.transparent,
      end: ThemeColors.background.withOpacity(0.6),
    ).animate(_backDropController);

    _colorTweenText = ColorTween(
      begin: ThemeColors.onPrimary,
      end: ThemeColors.onBackground,
    ).animate(_colorController);

    _colorTweenBorder = ColorTween(
      begin: ThemeColors.onPrimary,
      end: ThemeColors.fieldBorderDark,
    ).animate(_colorController);

    _backDropFilter = Tween<double>(
      begin: 0,
      end: 27,
    ).animate(_backDropController);

    super.initState();
  }

  @override
  void dispose() {
    _colorController.dispose();
    _backDropController.dispose();
    _menuScrollController.dispose();
    super.dispose();
  }

  bool buildCalledYet = false;

  @override
  Widget build(BuildContext context) {
    var topPadding = MediaQuery.of(context).padding.top + 60;
    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: ThemeColors.background,
          ),
          NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const HomeBackground(),
                  Column(
                    children: [
                      SizedBox(height: topPadding + 15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.only(
                                top: 20,
                                bottom: 15,
                                left: 20,
                                right: 20,
                              ),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                gradient: LinearGradient(
                                  colors: [
                                    ThemeColors.headerGradient1,
                                    ThemeColors.headerGradient2,
                                  ],
                                ),
                              ),
                              child: Column(
                                children: [
                                  RowContentButton(
                                    title: StringConst.taiKhoanGoc,
                                    content: '90.000 VNĐ',
                                    buttonTitle: StringConst.napTien,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(height: 20),
                                  RowContentButton(
                                    title: StringConst.taiKhoanKhuyenMai,
                                    content: '0 VNĐ',
                                    buttonTitle: StringConst.traCuoc,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.symmetric(
                                vertical: 17,
                                horizontal: 20,
                              ),
                              decoration: const BoxDecoration(
                                // borderRadius: BorderRadius.vertical(
                                //     bottom: Radius.circular(15)),
                                color: ThemeColors.primaryBlue,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  TextColumn(
                                    title: StringConst.thongTinData,
                                    content: 'Gói 90KC',
                                  ),
                                  TextColumn(
                                    title: StringConst.dataConLai,
                                    content: '815 MB',
                                  ),
                                  TextColumn(
                                    title: StringConst.hanSuDung,
                                    content: '23/07/2023',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 40,
                                vertical: 12,
                              ),
                              child: const Text(
                                StringConst.tienIchChinh,
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 190,
                                child: GridView.count(
                                  scrollDirection: Axis.horizontal,
                                  controller: _menuScrollController,
                                  physics: const BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.2,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  children: [
                                    for (final feature in mainFeatures.entries)
                                      MenuItem(
                                        svgIcon: feature.key,
                                        title: feature.value,
                                      ),
                                  ],
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _menuScrollController.hasClients &&
                                  _menuScrollController
                                          .position.maxScrollExtent >
                                      0,
                              child: Center(
                                child: ScrollIndicator(
                                  scrollController: _menuScrollController,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 250)
                    ],
                  )
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _colorController,
            builder: (context, child) {
              return HomeAppBar(
                searchTextColor: _colorTweenText.value,
                backgroundColor: _colorTween.value,
                searchBorderColor: _colorTweenBorder.value,
                sigmaValue: _backDropFilter.value,
                statusBarIconBrightness: _iconBrightness,
              );
            },
          ),
        ],
      ),
    );
  }
}
