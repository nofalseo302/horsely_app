import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/account/features/myorder/logic/controler/my_order_controller.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/iteam_order_tap_bar.dart';

class OrderTapBar extends GetView<MyOrderController> {
  const OrderTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
              color: const Color(0x4D221E0D).withOpacity(.05),
              borderRadius: BorderRadius.circular(17)),
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
