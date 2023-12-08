import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class AppModalBottomSheet extends StatelessWidget {
  const AppModalBottomSheet({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 5,
            left: 5,
            right: 5,
          ),
          width: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: child ?? Container(),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 7,
                      right: 7,
                    ),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeColors.exitSheet,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: ThemeColors.onPrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
