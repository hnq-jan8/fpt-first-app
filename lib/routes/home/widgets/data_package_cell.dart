import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/data/ads/ad_entity.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/cell/outlined_cell.dart';

class DataPackageCell extends StatelessWidget {
  const DataPackageCell({
    super.key,
    required this.dataPackage,
    required this.onPressed,
  });

  final DataPackage dataPackage;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedCell(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.5),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(Assets.icon_data_package),
                  Text(
                    dataPackage.title,
                    style: const TextStyle(
                      fontSize: 11.7,
                      height: 1.6,
                      color: ThemeColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConst.get(context)!.goiData_name(dataPackage.title),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${dataPackage.amount} - ${dataPackage.duration}',
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  Text(
                    dataPackage.price,
                    style: const TextStyle(
                      fontSize: 13.6,
                      height: 1.5,
                      color: ThemeColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                Assets.icon_next_dark,
                width: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
