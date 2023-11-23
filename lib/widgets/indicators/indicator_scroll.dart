import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({
    super.key,
    this.width = 17,
    this.indicatorWidth = 8,
    required this.scrollController,
  }) : assert(width > indicatorWidth,
            'width must be greater than indicatorWidth');

  final ScrollController scrollController;

  final double width;
  final double indicatorWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: width,
      decoration: BoxDecoration(
        color: ThemeColors.scrollIndicator,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SizedBox(
            width: scrollController.hasClients
                ? (width - indicatorWidth) *
                    (scrollController.offset /
                            scrollController.position.maxScrollExtent)
                        .clamp(0, 1)
                : 0,
          ),
          Container(
            width: indicatorWidth,
            decoration: BoxDecoration(
              color: ThemeColors.indicatorGradient2,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
