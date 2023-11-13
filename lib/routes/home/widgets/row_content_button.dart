import 'package:flutter/material.dart';

import 'package:next_app/routes/home/widgets/text_column.dart';
import 'package:next_app/theme/theme_colors.dart';

class RowContentButton extends StatelessWidget {
  const RowContentButton({
    super.key,
    required this.title,
    required this.content,
    required this.buttonTitle,
    required this.onPressed,
  });

  final String title;
  final String content;
  final String buttonTitle;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextColumn(
          title: title,
          content: content,
          fontSize: 15.7,
        ),
        SizedBox(
          width: 96,
          child: OutlinedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                const BorderSide(
                  color: ThemeColors.onPrimary,
                  width: 1,
                ),
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              splashFactory: NoSplash.splashFactory,
              overlayColor:
                  MaterialStateProperty.all(Colors.white.withOpacity(0.2)),
            ),
            child: Text(
              buttonTitle,
              style: const TextStyle(
                color: ThemeColors.onPrimary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}
