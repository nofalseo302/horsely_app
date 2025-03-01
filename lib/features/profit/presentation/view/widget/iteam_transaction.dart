import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class IteamTransaction extends StatelessWidget {
  const IteamTransaction(
      {super.key,
      required this.onTap,
      required this.itemData,
      this.isbuy = false});
  final void Function()? onTap;
  final P2pItem itemData;
  final bool isbuy;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  spreadRadius: -3)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: const Color(0xff8A8A8A).withOpacity(.1),
                child: ClipOval(
                  child: CustomImageHandler(
                    itemData.cryptoCurrency?.image ?? AppImages.logo,
                    width: 35,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Container(
                child: Text(
                  itemData.cryptoCurrency?.symbol ?? '',
                  style: AppStyles.semibold20(context),
                  overflow: TextOverflow
                      .ellipsis, // This ensures the title stays on one line
                  maxLines:
                      1, // Ensures the text doesn't take up more than one line
                ),
              ),
              subtitle: Text(
                itemData.cryptoCurrency?.name ?? '',
                style: AppStyles.semibold16(context)
                    .copyWith(color: const Color(0xff8A8A8A)),
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${(itemData.price ?? 0.0).toInt()}.',
                    style: AppStyles.semibold24(context)
                        .copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: (itemData.price ?? 0.0)
                        .toStringAsFixed(2)
                        .split('.')[1],
                    style: AppStyles.semibold24(context)
                        .copyWith(color: const Color(0xff8A8A8A)),
                  ),
                ],
              ),
            ),
            if (itemData.profit != null) ...[
              Text(
                  "${(itemData.profit ?? 0) >= 0 ? "+" : "-"} ${itemData.profit}% ",
                  style: AppStyles.semibold16(context).copyWith(
                    color: (itemData.profit ?? 0) >= 0
                        ? AppColors.primaryColor
                        : Colors.red,
                  )),
              // Text(
              //   "Revenue for August 2024",
              //   style: AppStyles.regulare10(context)
              //       .copyWith(color: const Color(0xff8A8A8A)),
              // )
            ]
          ],
        ),
      ),
    );
  }
}
