import 'package:flutter/material.dart';

import 'package:next_app/constants/string_const.dart';
import 'package:next_app/data/voucher/voucher_entity.dart';
import 'package:next_app/theme/theme_colors.dart';
import 'package:next_app/widgets/buttons/app_outlined_button.dart';

class VoucherCell extends StatelessWidget {
  const VoucherCell({
    super.key,
    required this.voucher,
    this.onPressed,
  });

  final Voucher voucher;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 20,
      ),
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 5),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
            ),
            child: Image.asset(
              voucher.image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 4,
              left: 5,
            ),
            color: ThemeColors.primary,
            child: Text(
              '${voucher.brand} - ${voucher.discount}%',
              style: const TextStyle(
                fontSize: 12,
                color: ThemeColors.onPrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              voucher.description,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7.5),
            child: Text(
              StringConst.get(context)!.hetHieuLucVao_date(voucher.expiredDate),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Center(
            child: AppOutlinedButton(
              onPressed: onPressed,
              color: ThemeColors.primaryBlue,
              horizontalPadding: 15,
              child: Text(
                StringConst.get(context)!.thuNhap,
                style: const TextStyle(
                  fontSize: 12.5,
                  color: ThemeColors.primaryBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
