import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/routes/help/widgets/faq_search.dart';
import 'package:next_app/routes/help/widgets/gradient_column_button.dart';
import 'package:next_app/widgets/buttons/cell_button.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/header/blur_header.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  double startingPadding = 5;

  Color headerColor = ThemeColors.background;

  bool isUsingVi = true;
  bool isUsingNotification = true;
  bool isUsingFaceId = true;
  bool isUsingOtp = false;

  ScrollController? _scrollController;

  TextEditingController? _searchController;

  List<String> faqs = [
    'Độ dài tối đa của một tin nhắn (SMS) là bao nhiêu?',
    'Khách hàng cá nhân sử dụng CMND có thể đăng ký bao nhiêu thuê bao trả trước',
    'eSim là gì?',
    'Thanh toán qua Fastpay có được xuất hoá đơn VAT không?',
    'Có bao nhiêu hình thức phát hành thông báo trước, cụ thể là những hình thức nào?',
    'Tôi có thể đăng ký nhận thông báo trước qua SMS hay không?',
    'Làm thế nào để chuyển chủ quyền SIM?'
  ];

  List _searchResult = [];

  void updateSearchResult(String query) {
    List<String> result = [];
    query = query.trim();

    for (String question in faqs) {
      if (question.toLowerCase().contains(query.toLowerCase())) {
        result.add(question);
      }
    }

    setState(() {
      _searchResult = result;
    });
  }

  @override
  void initState() {
    super.initState();

    _searchResult = faqs;

    _searchController = TextEditingController();
    _scrollController = ScrollController()
      ..addListener(() => setState(() {
            headerColor = _scrollController!.offset > 15
                ? ThemeColors.homeHeader
                : ThemeColors.background;
          }));
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    _searchController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    isUsingVi = StringConst.get(context)!.localeName == 'vi';

    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: BlurHeader(
        backgroundColor: headerColor,
      ),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Container(
                  color: ThemeColors.background,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: topPadding + startingPadding),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                          left: 1,
                        ),
                        child: Text(
                          StringConst.get(context)!.lienHeVoiChungToi,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GradientColumnButton(
                              onPressed: () {
                                debugPrint('Pressed 1');
                              },
                              title: StringConst.get(context)!.hotline,
                              svgAsset: Assets.icon_phone_gradient,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GradientColumnButton(
                              onPressed: () {
                                debugPrint('Pressed 2');
                              },
                              title: StringConst.get(context)!.email,
                              svgAsset: Assets.icon_email_gradient,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GradientColumnButton(
                              onPressed: () {
                                debugPrint('Pressed 3');
                              },
                              title: StringConst.get(context)!.daiLy,
                              svgAsset: Assets.icon_position_gradient,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 30,
                          left: 1,
                        ),
                        child: Text(
                          StringConst.get(context)!.cacCauHoiThuongGap,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FAQSearchBox(
                        onChanged: (String query) => updateSearchResult(query),
                        searchController: _searchController,
                      ),
                    ],
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        for (String question in _searchResult)
                          CellButton(
                            svgIconPath: Assets.icon_question,
                            title: question,
                            onPressed: () {},
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 160),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
