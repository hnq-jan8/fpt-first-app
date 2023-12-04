import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';
import 'package:next_app/widgets/header/header.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    const String updatedAt = 'Cập nhật ngày 27/07/2023' + '\n';
    const String exampleTextShort = '\nLorem ipsum dolor sit amet';
    const String exampleText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, quis ultricies nisl nisl eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, quis ultricies nisl nisl eget nisl. Donec euismod, nisl eget ultricies ultrices, nunc nisl ultricies nunc, quis ultricies nisl nisl eget nisl.';

    return Scaffold(
      backgroundColor: ThemeColors.background,
      appBar: Header(
        title: StringConst.get(context)!.chinhSachQuyenRiengTu,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: 120 + bottomPadding,
          ),
          child: const OutlinedCell(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    updatedAt,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                  Text(exampleText),
                  Text(exampleText),
                  Text(exampleTextShort,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(exampleText),
                  Text(exampleTextShort,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(exampleText),
                  Text(exampleText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
