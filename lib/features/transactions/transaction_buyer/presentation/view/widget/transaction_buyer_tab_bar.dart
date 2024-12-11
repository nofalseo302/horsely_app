import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/myorder/presentation/view/widget/iteam_order_tap_bar.dart';
import 'package:horsely_app/features/transactions/transaction_buyer/presentation/manager/transaction_buyer_tab_bar_controler.dart';

class TransactionBuyerTabBar extends StatelessWidget {
  const TransactionBuyerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TransactionBuyerTabBarControler controller = Get.put(
        TransactionBuyerTabBarControler()); // إنشاء instance من الـ controller

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xff4d221e0d).withOpacity(.05),
              borderRadius: BorderRadius.circular(17)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.toggleTab(0), // تغيير التاب النشط
                    child: Obx(() {
                      return IteamOrderTapBar(
                        active:
                            controller.activeIndex.value == 0, // تحقق من الحالة
                        title: AppStrings.buy.tr,
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.toggleTab(1), // تغيير التاب النشط
                    child: Obx(() {
                      return IteamOrderTapBar(
                        active:
                            controller.activeIndex.value == 1, // تحقق من الحالة
                        title: AppStrings.sell.tr,
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
