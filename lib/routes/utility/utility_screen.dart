import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/data/product/product_entity.dart';
import 'package:next_app/routes/home/widgets/ad_image.dart';
import 'package:next_app/routes/home/widgets/menu_item.dart';
import 'package:next_app/routes/utility/widgets/heading_row.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/buttons/gradient_button_title.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';
import 'package:next_app/widgets/header/blur_header.dart';
import 'package:next_app/widgets/indicators/indicator_scroll.dart';

class UtilityScreen extends StatefulWidget {
  const UtilityScreen({super.key});

  @override
  State<UtilityScreen> createState() => _UtilityScreenState();
}

class _UtilityScreenState extends State<UtilityScreen> {
  double startingPadding = 5;

  Color headerColor = ThemeColors.background;

  final ScrollController _scrollController = ScrollController();
  final ScrollController _adsScrollController = ScrollController();
  final ScrollController _menuScrollController = ScrollController();

  List<String> ads = [
    Assets.image_ad_demo_2,
    Assets.image_ad_demo_1,
    Assets.image_ad_demo_2,
    Assets.image_ad_demo_1,
    Assets.image_ad_demo_2,
    Assets.image_ad_demo_1,
    Assets.image_ad_demo_2,
  ];

  List saleProducts = [
    Phone(
      name: "iPhone 14 Pro Max 256GB",
      image: "assets/images/phone_iphone14_promax.png",
      availableStorage: ["128GB", "256GB", "512GB", "1TB"],
      storage: "256GB",
      discount: 0.45,
      specs: PhoneSpecs("Apple A16 Bionic", "6.7 inch", "256GB"),
      price: "29.790.000",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() {
          headerColor = _scrollController.offset > 15
              ? ThemeColors.homeHeader
              : ThemeColors.background;
        }));

    _adsScrollController.addListener(() => setState(() {}));
    _menuScrollController.addListener(() => setState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _adsScrollController.jumpTo(1);
      _adsScrollController.jumpTo(0);
      _menuScrollController.jumpTo(1);
      _menuScrollController.jumpTo(0);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _adsScrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> mainFeatures = {
      Assets.icon_call_history: StringConst.get(context)!.lichSuCuocGoi,
      Assets.icon_purchase_bills: StringConst.get(context)!.thanhToanHoaDon,
      Assets.icon_membership: StringConst.get(context)!.hoiVien,
      Assets.icon_personalize: StringConst.get(context)!.goiCuocCaNhanHoa,
      Assets.icon_look_up: StringConst.get(context)!.traCuuThongTin,
      Assets.icon_unlock: StringConst.get(context)!.moKhoaThueBao,
      Assets.icon_activate_sim: StringConst.get(context)!.kichHoatSim,
      Assets.icon_purchase_sim: StringConst.get(context)!.muaSim,
      Assets.icon_transfer: StringConst.get(context)!.chuyenTien,
    };

    double topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: BlurHeader(
        backgroundColor: headerColor,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: topPadding + startingPadding),
            SizedBox(
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
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 21,
                vertical: 4,
              ),
              child: Text(
                StringConst.get(context)!.nhungTienIchNoiBat,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 12.5,
              ),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  )
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      controller: _menuScrollController,
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 1,
                      childAspectRatio: 1.18,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
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
                  Visibility(
                    visible: _menuScrollController.hasClients &&
                        _menuScrollController.position.maxScrollExtent > 0,
                    child: Center(
                      child: ScrollIndicator(
                        scrollController: _menuScrollController,
                        width: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            HeadingRow(
              onPressed: () {},
              title: StringConst.get(context)!.flashDeal,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeColors.headerGradient1,
                    ThemeColors.primary,
                  ],
                ),
              ),
              child: Row(
                children: [
                  Image.asset(
                    Assets.image_flash_deals,
                    height: 172,
                    width: 160,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            HeadingRow(
              onPressed: () {},
              title: StringConst.get(context)!.cacSanPhamUuDaiTaiFptShop,
            ),
            const SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 7,
              ),
              child: OutlinedCell(
                onPressed: () {},
                child: Row(
                  children: [
                    Image.asset(
                      saleProducts[0].image,
                      height: 160,
                      width: 100,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            saleProducts[0].name,
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                saleProducts[0].specs.cpu,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                saleProducts[0].specs.screenSize,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                saleProducts[0].specs.storage,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${saleProducts[0].price}đ",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(
            //     horizontal: 20,
            //     vertical: 7,
            //   ),
            //   child: OutlinedCell(
            //     onPressed: () {},
            //     child: Row(
            //       children: [
            //         Image.asset(
            //           saleProducts[0].image,
            //           height: 160,
            //           width: 100,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 170,
                ),
                child: GradientButton(
                  onPressed: () {},
                  child: GradientButtonTitle(
                    buttonTitle: StringConst.get(context)!.xemThemTaiWebsite,
                  ),
                ),
              ),
            ),
            const SizedBox(
              // TODO: remove this later
              height: 500,
            ),
          ],
        ),
      ),
    );
  }
}
