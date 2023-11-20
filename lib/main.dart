import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
