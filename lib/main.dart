import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:next_app/router.dart';
import 'package:next_app/theme/theme_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ThemeColors.background,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
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
