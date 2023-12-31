import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/router.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/buttons/gradient_button_title.dart';
import 'package:next_app/widgets/indicators/indicator_dot.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({
    super.key,
    this.initialPage = 0,
  });

  final int initialPage;

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  Duration slideDuration = const Duration(milliseconds: 200);
  Duration textDuration = const Duration(milliseconds: 250);

  Curve curve = Curves.easeOut;

  bool isButtonPressed = false;
  int currentPage = 0;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() => currentPage = 1);
      } else if (_scrollController.offset <=
          _scrollController.position.minScrollExtent) {
        setState(() => currentPage = 0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void changePage({required int toPage}) {
    _scrollController.animateTo(
      toPage == 0 ? 0 : _scrollController.position.maxScrollExtent,
      duration: slideDuration,
      curve: curve,
    );
    setState(() => currentPage = toPage);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> introTitles = [
      StringConst.get(context)!.tienLoi,
      StringConst.get(context)!.deDangSuDung,
    ];

    final List<String> introContent = [
      StringConst.get(context)!.tichHopNhungDichVu_,
      StringConst.get(context)!.thongTinHienThiRo_,
    ];

    final List<String> buttonTitle = [
      '${StringConst.get(context)!.tiepTuc} ',
      StringConst.get(context)!.batDau,
    ];
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return PopScope(
      canPop: currentPage != 1,
      onPopInvoked: (didPop) {
        if (!didPop) {
          changePage(toPage: 0);
        }
      },
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        resizeToAvoidBottomInset: false,
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! > 0) {
              changePage(toPage: 0);
            } else if (details.primaryVelocity! < 0) {
              changePage(toPage: 1);
            }
          },
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 100),
                      SizedBox(
                        height: double.maxFinite,
                        child: Image.asset(
                          Assets.image_intro,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.bottomLeft,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ),
              const SizedBox(height: 40),
              Expanded(
                flex: 1,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: textDuration,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: Text(
                      introTitles[currentPage],
                      key: ValueKey<String>(introTitles[currentPage]),
                      style: const TextStyle(
                        color: Color(0xFFAB0059),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: Center(
                  child: AnimatedSwitcher(
                    duration: textDuration,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) =>
                            FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                    child: Text(
                      introContent[currentPage],
                      key: ValueKey<String>(introContent[currentPage]),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ThemeColors.onBackground,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IndicatorDot(
                    relativePage: 0,
                    currentPage: currentPage,
                    key: const ValueKey<int>(0),
                  ),
                  const SizedBox(width: 10),
                  IndicatorDot(
                    relativePage: 1,
                    currentPage: currentPage,
                    key: ValueKey<bool>(1 == currentPage),
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: GradientButton(
                    onPressed: currentPage == 0
                        ? () => changePage(toPage: 1)
                        : () =>
                            AppRouter.instance.navigateAndRemove(Routes.login),
                    child: GradientButtonTitle(
                      buttonTitle: buttonTitle[currentPage],
                      key: ValueKey<String>(buttonTitle[currentPage]),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30 + bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
