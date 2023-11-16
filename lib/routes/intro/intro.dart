import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/router.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/buttons/gradient_button_title.dart';
import 'package:next_app/widgets/indicators/indicator_dot.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key, this.initialPage = 0});

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

  final List<String> introTitles = [
    StringConst.tienLoi,
    StringConst.deDangSuDung,
  ];

  final List<String> introContent = [
    StringConst.tichHopNhungDichVu_,
    StringConst.thongTinHienThiRo_,
  ];

  final List<String> buttonTitle = [
    '${StringConst.tiepTuc} ',
    StringConst.batDau,
  ];

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
    return WillPopScope(
      onWillPop: currentPage == 1
          ? () {
              changePage(toPage: 0);
              return Future.value(false);
            }
          : null,
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              flex: 10,
              child: NotificationListener(
                onNotification: (notif) {
                  if (notif is ScrollUpdateNotification) {
                    if (notif.scrollDelta! > 0.1) {
                      changePage(toPage: 1);
                    } else if (notif.scrollDelta! < -0.1) {
                      changePage(toPage: 0);
                    }
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 100),
                      Image.asset(
                        Assets.image_intro,
                        fit: BoxFit.cover,
                        filterQuality: FilterQuality.high,
                        alignment: Alignment.bottomLeft,
                      ),
                    ],
                  ),
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
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
