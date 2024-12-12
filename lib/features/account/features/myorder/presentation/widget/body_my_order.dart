import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/features/account/features/myorder/logic/controler/my_order_controller.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/order_tap_bar.dart';
import 'package:horsely_app/features/account/features/offer/presentation/view/offer_screen.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_transaction.dart';

class BodyMyOrder extends GetView<MyOrderController> {
  const BodyMyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final MyOrderController controller = Get.put(MyOrderController());
    return Column(
      children: [
        const OrderTapBar(),
        Obx(() {
          return Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: controller.activeIndex.value == 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9,
                            // childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return IteamTransaction(
                              onTap: () {
                                Get.to(() => OfferScreen());
                              },
                            );
                          }),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9,
                            childAspectRatio: 1.1,
                          ),
                          itemBuilder: (context, index) {
                            return IteamTransaction(
                              onTap: () {
                                Get.to(() => OfferScreen());
                              },
                            );
                          }),
                    ),
            ),
          );
        }),
      ],
    );
  }
}
