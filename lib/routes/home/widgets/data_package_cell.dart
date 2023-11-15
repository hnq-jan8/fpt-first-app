import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:next_app/data/ads/ad_entity.dart';
import 'package:next_app/theme/assets.dart';
import 'package:next_app/theme/theme_colors.dart';

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
    return Ink(
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          color: ThemeColors.fieldBorderDark,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onPressed,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                        SvgPicture.asset(
                          Assets.icon_data_package,
                        ),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gói Data ${dataPackage.title}",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        dataPackage.description,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                      Text(
                        dataPackage.highlight,
                        style: const TextStyle(
                          fontSize: 13.6,
                          height: 1.5,
                          color: ThemeColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  Assets.icon_next_dark,
                  width: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
