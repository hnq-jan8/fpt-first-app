import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
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

  List<String> faqs = [
    'Độ dài tối đa của một tin nhắn (SMS) là bao nhiêu?',
    'Khách hàng cá nhân sử dụng CMND có thể đăng ký bao nhiêu thuê bao trả trước',
    'eSim là gì?',
    'Thanh toán qua Fastpay có được xuất hoá đơn VAT không?',
  ];

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;

    isUsingVi = StringConst.get(context)!.localeName == 'vi';

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: BlurHeader(
        backgroundColor: headerColor,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
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
              for (String question in faqs)
                CellButton(
                  svgIconPath: Assets.question,
                  title: question,
                  onPressed: () {},
                ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
