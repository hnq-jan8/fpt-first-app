import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/router.dart';
import 'package:next_app/theme/theme_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ThemeColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const MyApp());

  Future.delayed(const Duration(milliseconds: 750), () {
    FlutterNativeSplash.remove();
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Language currentLanguage = Language.vi;

  @override
  void initState() {
    _loadLanguage();
    super.initState();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      currentLanguage = Language.values[prefs.getInt('language') ?? 0];
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'FPT Test',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      navigatorKey: AppRouter.instance.navigatorKey,
      initialRoute: Routes.intro,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          background: ThemeColors.background,
          onBackground: ThemeColors.onBackground,
          primary: ThemeColors.primary,
          onPrimary: ThemeColors.onPrimary,
          secondary: ThemeColors.secondary,
          onSecondary: ThemeColors.onSecondary,
          error: ThemeColors.error,
          onError: ThemeColors.onError,
          surface: ThemeColors.surface,
          onSurface: ThemeColors.onSurface,
        ),
      ),
    );
  }
}
