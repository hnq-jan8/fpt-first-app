// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:next_app/routes/home/home.dart';
import 'package:next_app/routes/intro/intro.dart';
import 'package:next_app/routes/login/login.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String login_otp = '/login-otp';
  static const String home = '/home';
}

class AppRouter {
  static String currentPath = '';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory AppRouter() => _instance;

  AppRouter._internal();

  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndNavigateTo(
      {dynamic result, required String routeName, dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  dynamic popUntil() {
    return navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  dynamic popUntilWithName(String routeName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  dynamic pushNamedAndRemoveUntil(String pushName, String removeUntilName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        pushName, ModalRoute.withName(removeUntilName));
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic pop({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    currentPath = settings.name ?? '';
    debugPrint('Route: ${settings.name}');
    switch (settings.name) {
      case Routes.intro:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const IntroScreen(),
        );
      case Routes.login:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const LoginScreen(),
        );
      case Routes.home:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const HomePage(),
        );
    }
    return null;
  }
}
