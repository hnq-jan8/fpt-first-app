import 'package:flutter/material.dart';

import 'package:next_app/routes/home/widgets/text_column.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_outlined_button.dart';

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
        Expanded(
          child: TextColumn(
            title: title,
            content: content,
            fontSize: 15.7,
          ),
        ),
        SizedBox(
          width: 90,
          child: AppOutlinedButton(
            onPressed: onPressed,
            color: ThemeColors.onPrimary,
            borderRadius: 15,
            child: Text(
              buttonTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
