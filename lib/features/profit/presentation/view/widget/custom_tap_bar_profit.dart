import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_tap_bar_profit.dart';

class CustomTapBarProfit extends StatelessWidget {
  const CustomTapBarProfit({
    super.key,
    required this.controller,
  });

  final TapBarProfitControler controller;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Obx(() {
        return Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
              child: ItamTapBarProfit(
                nameiteam: AppStrings.daily.tr,
                isactive: controller.activeIndex.value == 0,
                onTap: () => controller.setActiveIndex(0),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
              child: ItamTapBarProfit(
                nameiteam: AppStrings.weekly.tr,
                isactive: controller.activeIndex.value == 1,
                onTap: () => controller.setActiveIndex(1),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
              child: ItamTapBarProfit(
                nameiteam: AppStrings.month.tr,
                isactive: controller.activeIndex.value == 2,
                onTap: () => controller.setActiveIndex(2),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
              child: ItamTapBarProfit(
                nameiteam: AppStrings.year.tr,
                isactive: controller.activeIndex.value == 3,
                onTap: () => controller.setActiveIndex(3),
              ),
            ),
          ],
        );
      }),
    );
  }
}
