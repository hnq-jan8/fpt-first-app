// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';

import 'package:next_app/routes/home/home.dart';
import 'package:next_app/routes/intro/intro.dart';
import 'package:next_app/routes/login/login.dart';
import 'package:next_app/routes/settings/views/app_info_screen.dart';
import 'package:next_app/routes/settings/views/policy_screen.dart';

class Routes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String login = '/login';
  static const String home = '/home';
  static const String policy = '/setting/policy';
  static const String appInfo = '/setting/app-info';
}

class AppRouter {
  static String currentPath = '';

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory AppRouter() => _instance;

  AppRouter._internal();

  static final AppRouter _instance = AppRouter._internal();

  static AppRouter get instance => _instance;

  ///
  /// Push a new route onto the navigation stack.
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  ///
  /// Pop the current route off the navigation stack and
  /// then push a new route
  Future<dynamic> popAndNavigateTo(
      {dynamic result, required String routeName, dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName, arguments: arguments);
  }

  ///
  /// Push a new route onto the navigation stack and remove all
  /// the previous routes
  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  ///
  /// Pop off routes from the navigation stack
  /// until the first route is reached.
  dynamic popUntil() {
    return navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  ///
  /// Pop off routes from the navigation stack
  /// until the route with the given name is reached.
  dynamic popUntilWithName(String routeName) {
    return navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }

  ///
  /// Push a new route onto the navigation stack and
  /// keep popping routes until the route with the given name is reached.
  dynamic pushNamedAndRemoveUntil(String pushName, String removeUntilName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        pushName, ModalRoute.withName(removeUntilName));
  }

  ///
  /// Replace the current route of the navigation stack
  /// with a new route.
  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  ///
  /// Pop the current route off the navigation stack.
  dynamic pop({dynamic result}) {
    return navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic>? generateRoute(RouteSettings settings,
      {dynamic arguments}) {
    debugPrint('Route: ${settings.name}');

    currentPath = settings.name ?? '';
    arguments = settings.arguments;

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

      case Routes.policy:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const PolicyScreen(),
        );

      case Routes.appInfo:
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => const AppInfoScreen(),
        );
    }
    return null;
  }
}
