import 'package:flutter/material.dart';

import 'package:next_app/routes/home/widgets/navigation_bar_item.dart';
import 'package:next_app/theme/theme_colors.dart';

// ignore_for_file: constant_identifier_names
const double DEFAULT_BAR_HEIGHT = 60;

const double DEFAULT_INDICATOR_HEIGHT = 2.5;

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  final Curve curve;
  final Color activeColor;
  final Color inactiveColor;
  final Color? indicatorColor;
  final bool enableShadow;
  int currentIndex;

  /// Called when a item is tapped.
  ///
  /// This provide the selected item's index.
  final ValueChanged<int> onPressed;

  /// The items of this navigation bar.
  ///
  /// This should contain at least two items and five at most.
  final List<NavigationBarItem> items;

  /// The selected item is indicator height.
  ///
  /// Defaults to [DEFAULT_INDICATOR_HEIGHT].
  final double indicatorHeight;

  /// Change the navigation bar's size.
  ///
  /// Defaults to [DEFAULT_BAR_HEIGHT].
  final double barHeight;

  CustomBottomNavigationBar({
    Key? key,
    this.curve = Curves.linear,
    required this.onPressed,
    required this.items,
    this.activeColor = ThemeColors.primary,
    this.inactiveColor = ThemeColors.dimText,
    this.indicatorColor,
    this.enableShadow = true,
    this.currentIndex = 0,
    this.indicatorHeight = DEFAULT_INDICATOR_HEIGHT,
    this.barHeight = DEFAULT_BAR_HEIGHT,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  @override
  State createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<CustomBottomNavigationBar> {
  Duration duration = const Duration(milliseconds: 150);
  Curve curve = Curves.easeOut;

  @override
  Widget build(BuildContext context) {
    var itemWidth =
        (MediaQuery.of(context).size.width - 10) / widget.items.length;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      clipBehavior: Clip.hardEdge,
      constraints: BoxConstraints(
        minHeight: widget.indicatorHeight + widget.barHeight,
        maxHeight: widget.indicatorHeight + widget.barHeight,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        boxShadow: widget.enableShadow
            ? [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -5),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              return Expanded(
                child: GestureDetector(
                  onTap: () => _select(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildItemWidget(
                        item,
                        index == widget.currentIndex,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          Row(
            children: [
              AnimatedSize(
                duration: duration,
                curve: curve,
                child: SizedBox(
                  width: itemWidth * widget.currentIndex,
                ),
              ),
              Expanded(
                child: Container(
                  height: widget.indicatorHeight,
                  margin: const EdgeInsets.only(top: 1, left: 10, right: 10),
                  decoration: BoxDecoration(
                    color: widget.activeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AnimatedSize(
                duration: duration,
                curve: curve,
                child: SizedBox(
                  width: itemWidth * (widget.items.length - 1) -
                      itemWidth * widget.currentIndex,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _select(int index) {
    widget.currentIndex = index;
    widget.onPressed(widget.currentIndex);

    setState(() {});
  }

  Widget _buildItemWidget(NavigationBarItem item, bool isSelected) {
    return Container(
      color: item.backgroundColor,
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Stack(
            children: [
              Center(
                child: IconTheme(
                  data: IconThemeData(
                    color:
                        !isSelected ? widget.inactiveColor : widget.activeColor,
                  ),
                  child: isSelected ? item.activeIcon : item.inactiveIcon,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: (item.notifUnreadCount != null &&
                        item.notifUnreadCount != 0)
                    ? Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF44336),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: const EdgeInsets.only(
                          left: 3,
                          right: 3,
                          top: 1,
                          bottom: 1,
                        ),
                        margin: const EdgeInsets.only(left: 25),
                        child: Text(
                          '${item.notifUnreadCount ?? 0}',
                          style: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                          ),
                        ),
                      )
                    : Container(),
              )
            ],
          ),
          const SizedBox(height: 2),
          DefaultTextStyle.merge(
            child: Text(item.title),
            style: TextStyle(
              color: isSelected
                  ? ThemeColors.primary
                  : ThemeColors.navigationBarDimText,
              fontSize: 11.5,
              fontWeight: isSelected ? FontWeight.w400 : FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
