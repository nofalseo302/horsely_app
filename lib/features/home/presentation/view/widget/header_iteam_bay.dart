import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class HeaderIteamBuy extends StatelessWidget {
  const HeaderIteamBuy({
    super.key,
    required this.isbuy,
    required this.namebuttom,
    required this.item,
    this.onTap,
  });
  final bool isbuy;
  final P2pItem item;
  final String namebuttom;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          item.amount.toString(),
          style: AppStyles.semibold18(context),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          " ${item.cryptoCurrency?.symbol ?? ""} ",
          style: AppStyles.semibold14(context)
              .copyWith(color: const Color(0xff545454)),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: !isbuy ? AppColors.primaryColor : Colors.red,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 8),
              child: Text(
                namebuttom,
                style:
                    AppStyles.semibold12(context).copyWith(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
