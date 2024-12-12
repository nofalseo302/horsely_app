import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/iteam_order_tap_bar.dart';
import 'package:horsely_app/features/account/features/transaction_buyer/logic/controller/transaction_controller.dart';

class TransactionBuyerTabBar extends GetView<TransactionsController> {
  const TransactionBuyerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    // final TransctionController controller = Get.put(TransctionController());

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xff4d221e0d).withOpacity(.05),
            borderRadius: BorderRadius.circular(17),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.toggleTab(0),
                    child: Obx(() {
                      return IteamOrderTapBar(
                        active: controller.activeIndex.value == 0,
                        title: AppStrings.buy.tr,
                      );
                    }),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => controller.toggleTab(1),
                    child: Obx(() {
                      return IteamOrderTapBar(
                        active: controller.activeIndex.value == 1,
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
