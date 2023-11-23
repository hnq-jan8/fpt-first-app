import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

// ignore: constant_identifier_names
const double DEFAULT_WIDTH_TOTAL = 44;

// ignore: constant_identifier_names
const double DEFAULT_WIDTH_BUTTON = 19;

// ignore: constant_identifier_names
const double DEFAULT_HEIGHT = 19;

// ignore: constant_identifier_names
const double DEFAULT_PADDING = 3;

class AppSwitch extends StatefulWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isColorUpdate = true,
    this.text,
    this.textOff,
    this.textColor = ThemeColors.onPrimary,
    this.textOffColor = ThemeColors.onPrimary,
  }) : assert(
          textOff == null || text != null,
          'textOff can only be used when text is not null',
        );

  final bool value;
  final bool isColorUpdate;

  final ValueChanged<bool>? onChanged;

  /// Text that will be displayed inside the gradient switch
  final String? text;

  /// Text that will be displayed inside the gradient switch
  /// when value is false
  final String? textOff;

  final Color textColor;
  final Color textOffColor;

  @override
  State<AppSwitch> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  final double switchWidth = DEFAULT_WIDTH_TOTAL;
  final double switchButtonWidth = DEFAULT_WIDTH_BUTTON;

  final double switchHeight = DEFAULT_HEIGHT;

  final double switchPadding = DEFAULT_PADDING;

  final Curve switchCurve = Curves.easeInOut;

  final Duration switchDuration = const Duration(milliseconds: 150);

  bool isDragging = false;
  bool isOnToggle = false;

  late double dragPosition;
  late double dragUpperLimit;

  Color get textColor => dragPosition > (dragUpperLimit - 5) * 0.5
      ? widget.textOffColor
      : widget.textColor;

  @override
  void initState() {
    super.initState();

    dragUpperLimit = switchWidth - switchButtonWidth;
    dragPosition = widget.value ? switchPadding : dragUpperLimit;
  }

  @override
  void didUpdateWidget(covariant AppSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _dragTo(widget.value);
    }
  }

  void _dragUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = (dragPosition + details.delta.dx)
          .clamp(switchPadding, dragUpperLimit - 5);
    });
  }

  void _dragTo(bool value) {
    dragPosition = value ? switchPadding : dragUpperLimit;
  }

  bool _setValueWithDragPosition() {
    if (dragPosition > (dragUpperLimit - 5) * 0.5) {
      _dragTo(false);
      return false;
    }
    _dragTo(true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => widget.onChanged?.call(!widget.value),
      onHorizontalDragDown: (details) {
        setState(() {
          isOnToggle = true;
        });
      },
      onHorizontalDragUpdate: (details) {
        setState(() {
          isDragging = true;
        });
        _dragUpdate(details);
      },
      onHorizontalDragCancel: () {
        setState(() {
          isOnToggle = false;
          isDragging = false;
        });
        _dragTo(widget.value);
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          isOnToggle = false;
          isDragging = false;
        });
        widget.onChanged?.call(_setValueWithDragPosition());
      },
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: switchHeight + switchPadding * 2,
            width: switchWidth + switchPadding * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ThemeColors.switchBackground,
            ),
          ),
          AnimatedOpacity(
            duration:
                isDragging ? const Duration(milliseconds: 1) : switchDuration,
            opacity: widget.isColorUpdate
                ? (1 -
                    (((dragPosition - switchPadding) / dragUpperLimit) * 1.5)
                        .clamp(0, 1))
                : 1,
            child: Container(
              height: switchHeight + switchPadding * 2,
              width: switchWidth + switchPadding * 1,
              margin: const EdgeInsets.symmetric(vertical: 10),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    ThemeColors.indicatorGradient1,
                    ThemeColors.indicatorGradient2,
                  ],
                ),
              ),
              child: widget.text != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.textOff != null
                              ? widget.textOff.toString()
                              : widget.text.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 10.7,
                          ),
                        ),
                        AnimatedSize(
                          duration: switchDuration,
                          curve: switchCurve,
                          child: SizedBox(
                            width: isOnToggle ? 12.9 : 9,
                          ),
                        ),
                        Text(
                          widget.text.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 10.7,
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
          ),
          AnimatedPositioned(
            duration:
                isDragging ? const Duration(milliseconds: 1) : switchDuration,
            curve: switchCurve,
            left: isOnToggle && dragPosition == dragUpperLimit
                ? dragPosition - 5
                : dragPosition,
            width: isOnToggle ? switchButtonWidth + 5 : switchButtonWidth,
            child: Container(
              height: switchHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeColors.onPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
