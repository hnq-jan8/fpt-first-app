import 'package:flutter/material.dart';

class NavigationBarItem {
  /// The title of this item.
  final String title;

  /// The icon of this item.
  ///
  /// If this is not a [Icon] widget, you must handle the color manually.
  final Widget inactiveIcon;

  final Widget activeIcon;

  /// The background color of this item.
  ///
  /// Defaults to [Colors.white].
  final Color backgroundColor;

  ///Number unread notification.
  final int? notifCountUnread;

  NavigationBarItem({
    required this.inactiveIcon,
    required this.activeIcon,
    required this.title,
    this.backgroundColor = Colors.white,
    this.notifCountUnread
  });
}
