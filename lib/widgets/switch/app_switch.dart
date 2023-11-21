import 'package:flutter/material.dart';

import 'package:next_app/theme/theme_colors.dart';

// ignore: constant_identifier_names
const double DEFAULT_WIDTH_TOTAL = 46;

// ignore: constant_identifier_names
const double DEFAULT_WIDTH_BUTTON = 23;

// ignore: constant_identifier_names
const double DEFAULT_HEIGHT = 19;

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

  final Curve switchCurve = Curves.easeInOut;

  final Duration switchDuration = const Duration(milliseconds: 200);

  bool isDragging = false;

  late double dragPosition;

  String? get text => dragPosition > (switchWidth - switchButtonWidth) * 0.5
      ? widget.textOff ?? widget.text
      : widget.text;

  Color get textColor => dragPosition > (switchWidth - switchButtonWidth) * 0.5
      ? widget.textOffColor
      : widget.textColor;

  @override
  void initState() {
    super.initState();

    dragPosition = widget.value ? 0 : switchWidth - switchButtonWidth;
  }

  @override
  void didUpdateWidget(covariant AppSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _dragTo(widget.value);
    }
  }

  LinearGradient? _defaultColorUpdate() {
    return widget.value || !widget.isColorUpdate
        ? const LinearGradient(colors: [
            ThemeColors.indicatorGradient1,
            ThemeColors.indicatorGradient2,
          ])
        : null;
  }

  void _dragUpdate(DragUpdateDetails details) {
    setState(() {
      dragPosition = (dragPosition + details.delta.dx)
          .clamp(0, switchWidth - switchButtonWidth);
    });
  }

  void _dragTo(bool value) {
    dragPosition = value ? 0 : switchWidth - switchButtonWidth;
  }

  bool _setValueWithDragPosition() {
    if (dragPosition > (switchWidth - switchButtonWidth) * 0.4) {
      _dragTo(false);
      return false;
    }
    _dragTo(true);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        widget.onChanged?.call(!widget.value);
        _dragTo(!widget.value);
      },
      onHorizontalDragDown: (details) {
        setState(() {
          isDragging = true;
        });
      },
      onHorizontalDragUpdate: (details) {
        _dragUpdate(details);
      },
      onHorizontalDragCancel: () {
        setState(() {
          isDragging = false;
        });
      },
      onHorizontalDragEnd: (details) {
        setState(() {
          isDragging = false;
        });

        widget.onChanged?.call(_setValueWithDragPosition());
      },
      child: Container(
        height: switchHeight,
        width: switchWidth,
        decoration: BoxDecoration(
          color: ThemeColors.scrollIndicator,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            AnimatedSize(
              duration:
                  isDragging ? const Duration(milliseconds: 1) : switchDuration,
              curve: switchCurve,
              child: SizedBox(
                width: dragPosition,
              ),
            ),
            Container(
              width: switchButtonWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ThemeColors.dimText,
                gradient: _defaultColorUpdate(),
              ),
              child: text != null
                  ? Center(
                      child: Text(
                        text.toString(),
                        maxLines: 1,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: textColor,
                          fontSize: 10.5,
                          height: 1.2,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
