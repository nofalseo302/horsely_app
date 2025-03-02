import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_skeletonizer.dart';

import 'package:horsely_app/features/account/features/myorder/logic/controler/my_order_controller.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/order_tap_bar.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_transaction.dart';
import 'package:horsely_app/routes/routes.dart';

class BodyMyOrder extends GetView<MyOrderController> {
  const BodyMyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrderTapBar(),
        Obx(() => controller.activeIndex.value == 0
            ? Expanded(
                child: CustomLoadingAnimation(
                    state: controller.isLoading.value
                        ? currentState.loading
                        : controller.buyData.value?.data?.data == null
                            ? currentState.failure
                            : controller.buyData.value!.data!.data!.isEmpty
                                ? currentState.empty
                                : currentState.success,
                    onFail: () async {
                      controller.getBuyData();
                    },
                    animationType: AnimationType.skeletonizer,
                    enable: controller.isLoading.value,
                    widget: RefreshIndicator(
                        onRefresh: () async {
                          controller.getBuyData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              itemCount: controller
                                      .buyData.value?.data?.data?.length ??
                                  0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 9,
                                crossAxisSpacing: 9,
                                childAspectRatio: 1 / .82,
                              ),
                              itemBuilder: (context, index) {
                                return IteamTransaction(
                                  itemData: controller
                                      .buyData.value!.data!.data![index],
                                  onTap: () {
                                    Get.toNamed(Routes.offers, arguments: {
                                      'id': controller
                                          .buyData.value!.data!.data![index].id,
                                      'title': controller.buyData.value!.data!
                                          .data![index].cryptoCurrency?.name
                                    });
                                  },
                                );
                              }),
                        ))),
              )
            : Expanded(
                child: CustomLoadingAnimation(
                    state: controller.isLoading.value
                        ? currentState.loading
                        : controller.sellData.value?.data?.data == null
                            ? currentState.failure
                            : controller.sellData.value!.data!.data!.isEmpty
                                ? currentState.empty
                                : currentState.success,
                    onFail: () async {
                      controller.getSellData();
                    },
                    animationType: AnimationType.skeletonizer,
                    enable: controller.isLoading.value,
                    widget: RefreshIndicator(
                        onRefresh: () async {
                          controller.getSellData();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              itemCount: controller
                                      .sellData.value?.data?.data?.length ??
                                  0,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 9,
                                crossAxisSpacing: 9,
                                childAspectRatio: 1.1,
                              ),
                              itemBuilder: (context, index) {
                                return IteamTransaction(
                                  itemData: controller
                                      .sellData.value!.data!.data![index],
                                  onTap: () {
                                    Get.toNamed(Routes.offers, arguments: {
                                      'id': controller
                                          .buyData.value!.data!.data![index].id,
                                      'title': controller.buyData.value!.data!
                                          .data![index].cryptoCurrency?.name
                                    });
                                  },
                                );
                              }),
                        ))),
              ))
      ],
    );
  }
}
