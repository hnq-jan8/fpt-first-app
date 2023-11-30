import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/data/product/product_entity.dart';
import 'package:next_app/routes/utility/widgets/prod_small_cell.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_button.dart';
import 'package:next_app/widgets/buttons/app_button_text.dart';

import 'package:next_app/widgets/cell/outlined_cell.dart';

class ProductCell extends StatelessWidget {
  const ProductCell({
    super.key,
    required this.product,
    this.onPressedCell,
    this.onPressedButton1,
    this.onPressedButton2,
  });

  final Phone product;

  final VoidCallback? onPressedCell;
  final VoidCallback? onPressedButton1;
  final VoidCallback? onPressedButton2;

  @override
  Widget build(BuildContext context) {
    return OutlinedCell(
      onPressed: onPressedCell,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 7,
      ),
      padding: const EdgeInsets.only(
        top: 12,
        bottom: 12,
        left: 10,
      ),
      child: Row(
        children: [
          Image.asset(
            product.image,
            width: 125,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ProductSmallerCell(
                      feature: StringConst.get(context)!
                          .installment_rate(product.installment),
                    ),
                    ProductSmallerCell(
                      feature: StringConst.get(context)!
                          .discount_rate(product.discount),
                      fillColor: ThemeColors.primaryOrange,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                    right: 10,
                  ),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: 29,
                  margin: const EdgeInsets.symmetric(vertical: 7.5),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: product.availableStorage.length,
                    itemBuilder: (context, index) {
                      return ProductSmallerCell(
                        feature: product.availableStorage[index],
                        textColor:
                            product.storage == product.availableStorage[index]
                                ? ThemeColors.onPrimary
                                : ThemeColors.primaryBlue,
                        fillColor:
                            product.storage == product.availableStorage[index]
                                ? ThemeColors.primaryBlue
                                : Colors.transparent,
                        borderColor: ThemeColors.primaryBlue,
                      );
                    },
                  ),
                ),
                Container(
                  width: 125,
                  height: 30,
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: ThemeColors.transparentPriceTag,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: double.infinity,
                        width: (1 - product.discount / 100) * 125,
                        color: ThemeColors.primaryOrange,
                      ),
                      Center(
                        child: Text(
                          "${product.price}đ",
                          style: const TextStyle(
                            color: ThemeColors.onPrimary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        product.specs.cpu,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.specs.screenSize,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        product.specs.storage,
                        style: const TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    AppButton(
                      onPressed: onPressedButton1,
                      height: 20,
                      borderRadius: 7,
                      color: ThemeColors.primaryOrange,
                      child: AppButtonText(
                        title: StringConst.get(context)!.muaNgay.toUpperCase(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    AppButton(
                      onPressed: onPressedButton2,
                      height: 20,
                      borderRadius: 7,
                      color: ThemeColors.greyButton,
                      child: AppButtonText(
                        title: StringConst.get(context)!.soSanh.toUpperCase(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
