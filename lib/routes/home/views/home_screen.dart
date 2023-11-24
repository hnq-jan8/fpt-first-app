import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/data/ads/ad_entity.dart';
import 'package:next_app/routes/home/widgets/ad_image.dart';
import 'package:next_app/routes/home/widgets/data_package_cell.dart';
import 'package:next_app/routes/home/widgets/home_app_bar.dart';
import 'package:next_app/routes/home/widgets/home_background.dart';
import 'package:next_app/routes/home/widgets/home_gradient_content.dart';
import 'package:next_app/routes/home/widgets/menu_item.dart';
import 'package:next_app/routes/home/widgets/text_column.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/buttons/gradient_button_title.dart';
import 'package:next_app/widgets/indicators/indicator_scroll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<String> ads = [
    Assets.image_ad_demo_2,
    Assets.image_ad_demo_1,
    Assets.image_ad_demo_2,
  ];

  List<DataPackage> offers = [
    DataPackage("HD70", "6GB - HSD 30 ngày", "70.000 VNĐ/tháng"),
    DataPackage("HD50", "3GB - HSD 30 ngày", "50.000 VNĐ/tháng"),
    DataPackage("D10", "4GB - HSD 1 ngày", "10.000 VNĐ/ngày"),
  ];

  late AnimationController _colorController;
  late AnimationController _backDropController;

  late Animation _colorTween;
  late Animation _colorTweenText;
  late Animation _colorTweenBorder;
  late Animation _backDropFilter;

  Brightness _iconBrightness = Brightness.light;

  double avatarRadius = 25;
  double backgroundHeight = 5;
  double backgroundOpacity = 1;

  final ScrollController _menuScrollController = ScrollController();
  final ScrollController _adsScrollController = ScrollController();

  bool _scrollListener(ScrollNotification info) {
    if (info.metrics.axis == Axis.vertical) {
      _colorController.animateTo(info.metrics.pixels * 2 / 100);
      _backDropController.animateTo(info.metrics.pixels.abs() * 1.5 / 100);

      _iconBrightness =
          info.metrics.pixels < 30 ? Brightness.light : Brightness.dark;

      avatarRadius = info.metrics.pixels > 5 ? 17 : 25;

      setState(() {
        backgroundHeight = info.metrics.pixels > 0
            ? 5
            : (-1.05 * info.metrics.pixels).clamp(5, double.infinity);
        backgroundOpacity = info.metrics.pixels > 0
            ? 1
            : (1 + info.metrics.pixels / 50).clamp(0, 1);
      });
    }
    return true;
  }

  @override
  void initState() {
    _menuScrollController.addListener(() {
      setState(() {});
    });
    _adsScrollController.addListener(() {
      setState(() {});
    });

    // update scroll position for showing scroll indicator
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _menuScrollController.jumpTo(1);
      _menuScrollController.jumpTo(0);
      _adsScrollController.jumpTo(1);
      _adsScrollController.jumpTo(0);
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
      end: ThemeColors.homeHeader,
    ).animate(_colorController);

    _colorTweenText = ColorTween(
      begin: ThemeColors.onPrimary,
      end: ThemeColors.homeSearchDark,
    ).animate(_colorController);

    _colorTweenBorder = ColorTween(
      begin: ThemeColors.fieldBorderLight,
      end: ThemeColors.fieldBorderDark,
    ).animate(_colorController);

    _backDropFilter = Tween<double>(
      begin: 0,
      end: 36,
    ).animate(_backDropController);

    super.initState();
  }

  @override
  void dispose() {
    _colorController.dispose();
    _backDropController.dispose();

    _menuScrollController.dispose();
    _adsScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> mainFeatures = {
      Assets.icon_call_history: StringConst.get(context)!.lichSuCuocGoi,
      Assets.icon_unlock: StringConst.get(context)!.moKhoaThueBao,
      Assets.icon_purchase_bills: StringConst.get(context)!.thanhToanHoaDon,
      Assets.icon_activate_sim: StringConst.get(context)!.kichHoatSim,
      Assets.icon_membership: StringConst.get(context)!.hoiVien,
      Assets.icon_purchase_sim: StringConst.get(context)!.muaSim,
      Assets.icon_personalize: StringConst.get(context)!.goiCuocCaNhanHoa,
      Assets.icon_transfer: StringConst.get(context)!.chuyenTien,
      Assets.icon_look_up: StringConst.get(context)!.traCuuThongTin,
      Assets.icon_vas_service: StringConst.get(context)!.dichVuVas,
    };

    var topPadding = MediaQuery.of(context).padding.top + 60;
    return Material(
      color: ThemeColors.background,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: backgroundHeight,
            width: double.infinity,
            color: ThemeColors.backgroundMedium,
          ),
          NotificationListener<ScrollNotification>(
            onNotification: _scrollListener,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  HomeBackground(
                    imageOpacity: backgroundOpacity,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: topPadding + 15),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HomeGradientContentBox(
                              title1: StringConst.get(context)!.taiKhoanGoc,
                              content1: '90.000 VNĐ',
                              buttonTitle1: StringConst.get(context)!.napTien,
                              onPressed1: () {},
                              title2:
                                  StringConst.get(context)!.taiKhoanKhuyenMai,
                              content2: '0 VNĐ',
                              buttonTitle2: StringConst.get(context)!.traCuoc,
                              onPressed2: () {},
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
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
                                children: [
                                  TextColumn(
                                    title:
                                        StringConst.get(context)!.thongTinData,
                                    content: 'Gói 90KC',
                                  ),
                                  TextColumn(
                                    title: StringConst.get(context)!.dataConLai,
                                    content: '815 MB',
                                  ),
                                  TextColumn(
                                    title: StringConst.get(context)!.hanSuDung,
                                    content: '23/07/2023',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 4,
                              ),
                              child: Text(
                                StringConst.get(context)!.tienIchChinh,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                height: 200,
                                child: GridView.count(
                                  scrollDirection: Axis.horizontal,
                                  controller: _menuScrollController,
                                  physics: const BouncingScrollPhysics(),
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.2,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  children: [
                                    for (final feature in mainFeatures.entries)
                                      MenuItem(
                                        svgIcon: feature.key,
                                        title: feature.value,
                                        onPressed: () {},
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
                      const SizedBox(height: 10),
                      Center(
                        child: SizedBox(
                          height: 150,
                          child: GridView.count(
                            physics: const BouncingScrollPhysics(),
                            controller: _adsScrollController,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            crossAxisCount: 1,
                            childAspectRatio: 0.55,
                            children: [
                              for (final ad in ads)
                                AdImage(
                                  image: ad,
                                  onPressed: () {},
                                ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _adsScrollController.hasClients &&
                            _adsScrollController.position.maxScrollExtent > 0,
                        child: Center(
                          child: ScrollIndicator(
                            scrollController: _adsScrollController,
                            width: 25,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 21,
                          top: 15,
                          bottom: 8,
                        ),
                        child: Text(
                          StringConst.get(context)!.cacGoiCuocUuDai,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (final offer in offers)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 7,
                          ),
                          child: DataPackageCell(
                            onPressed: () {},
                            dataPackage: offer,
                          ),
                        ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 40,
                            bottom: 64,
                          ),
                          child: GradientButton(
                            onPressed: () {},
                            child: GradientButtonTitle(
                              buttonTitle: StringConst.get(context)!
                                  .dieuChinhManHinhChinh,
                            ),
                          ),
                        ),
                      ),
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
                avatarRadius: avatarRadius,
                notifUnreadCount: 7,
              );
            },
          ),
        ],
      ),
    );
  }
}
