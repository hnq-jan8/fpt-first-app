import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/router.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_button.dart';
import 'package:next_app/widgets/buttons/app_button_text.dart';
import 'package:next_app/widgets/buttons/gradient_button.dart';
import 'package:next_app/widgets/buttons/gradient_button_title.dart';
import 'package:next_app/routes/login/widgets/icon_cell.dart';
import 'package:next_app/widgets/header/header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool buttonSignInVisibility = false;

  var fieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fieldController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    fieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List hintText = [
      StringConst.get(context)!.nhapSdt,
      StringConst.get(context)!.nhapOtp,
    ];

    final List iconField = [
      Assets.icon_phone,
      Assets.icon_keyboard,
    ];

    final List otpButtonTitle = [
      StringConst.get(context)!.guiOtp,
      StringConst.get(context)!.guiLaiOtp,
    ];

    bool isKeyboardUp = MediaQuery.of(context).viewInsets.bottom != 0;

    double topPadding = MediaQuery.of(context).padding.top;

    return WillPopScope(
      onWillPop: buttonSignInVisibility
          ? () {
              // override device back button
              setState(() => buttonSignInVisibility = false);
              FocusScope.of(context).unfocus();
              fieldController.clear();
              return Future(() => false);
            }
          : null,
      child: Scaffold(
        backgroundColor: ThemeColors.background,
        extendBodyBehindAppBar: true,
        appBar: Header(
          onBack: onBackCustom,
          showBack: buttonSignInVisibility,
          useGradient: false,
          sigmaValue: 5,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SafeArea(
              top: false,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.manual,
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(19),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: topPadding + kToolbarHeight),
                        Image.asset(
                          Assets.image_logo,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 50),
                        TextField(
                          controller: fieldController,
                          keyboardType: TextInputType.phone,
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ThemeColors.inputBackground,
                            prefixIcon: Container(
                              width: 64,
                              padding: const EdgeInsets.only(
                                top: 1,
                                left: 20,
                                right: 18,
                              ),
                              child: SvgPicture.asset(
                                iconField[!buttonSignInVisibility ? 0 : 1],
                              ),
                            ),
                            hintText: hintText[!buttonSignInVisibility ? 0 : 1],
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.hintText,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: ThemeColors.fieldBorder,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                width: 2,
                                color: ThemeColors.fieldBorder,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Visibility(
                            visible: buttonSignInVisibility,
                            child: Column(
                              children: [
                                GradientButton(
                                  onPressed: onTapSignIn,
                                  child: GradientButtonTitle(
                                    buttonTitle:
                                        StringConst.get(context)!.dangNhap,
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                        GradientButton(
                          gradientColor1: buttonSignInVisibility
                              ? ThemeColors.dimText
                              : ThemeColors.buttonGradient1,
                          gradientColor2: buttonSignInVisibility
                              ? ThemeColors.dimText
                              : ThemeColors.buttonGradient2,
                          textGradientColor1: buttonSignInVisibility
                              ? ThemeColors.dimText
                              : ThemeColors.textGradient1,
                          textGradientColor2: buttonSignInVisibility
                              ? ThemeColors.dimText
                              : ThemeColors.textGradient2,
                          onPressed: onTapSendOtp,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) =>
                                    FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                            child: GradientButtonTitle(
                              buttonTitle: otpButtonTitle[
                                  !buttonSignInVisibility ? 0 : 1],
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeOut,
                          child: Visibility(
                            visible: !buttonSignInVisibility,
                            maintainAnimation: true,
                            maintainState: true,
                            child: Column(
                              children: [
                                const SizedBox(height: 70),
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    onPressed: () {},
                                    child: AppButtonText(
                                        title: StringConst.get(context)!
                                            .dangNhapFaceId),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    onPressed: () {},
                                    color: ThemeColors.primaryBlue,
                                    child: AppButtonText(
                                        title: StringConst.get(context)!
                                            .dangNhapMatKhau),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Text(
                                  StringConst.get(context)!.hoacDangNhapVs,
                                  style: const TextStyle(
                                      color: ThemeColors.dimText),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 25,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconCell(
                                        Assets.icon_facebook,
                                        onPressed: () {},
                                      ),
                                      IconCell(
                                        Assets.icon_google,
                                        onPressed: () {},
                                      ),
                                      IconCell(
                                        Assets.icon_apple,
                                        onPressed: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Visibility(
                visible: !buttonSignInVisibility && !isKeyboardUp,
                child: SafeArea(
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 12,
                        sigmaY: 12,
                      ), //
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringConst.get(context)!.banCoSimFTelMoi,
                            style: const TextStyle(fontSize: 13.2),
                          ),
                          TextButton(
                            style: const ButtonStyle(
                              splashFactory: NoSplash.splashFactory,
                            ),
                            onPressed: () {},
                            child: Text(
                              StringConst.get(context)!.kichHoatSimTaiDay,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13.2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onBackCustom() {
    if (buttonSignInVisibility) {
      setState(() => buttonSignInVisibility = false);
      fieldController.clear();
    } else {
      AppRouter.instance.pop();
    }
  }

  void onTapSendOtp() {
    // if (fieldController.text.isEmpty) {
    //   return;
    // }
    debugPrint('Input: ${fieldController.text}');
    setState(() => buttonSignInVisibility = true); // fix later
    fieldController.clear();
  }

  void onTapSignIn() {
    AppRouter.instance.navigateTo(Routes.home);
  }
}
