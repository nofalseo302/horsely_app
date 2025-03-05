import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
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
            ? controller.isLoading.value
                ? Column(
                    children: [
                      SizedBox(
                        height: Get.height * .5,
                      ),
                      const CustomLoader(),
                    ],
                  )
                : controller.isFailBuy.value
                    ? Column(
                        children: [
                          SizedBox(
                            height: Get.height * .3,
                          ),
                          RetryWidget(onRetry: () {
                            controller.getBuyData();
                          }),
                        ],
                      )
                    : controller.buyData.value?.data?.data?.isEmpty ?? false
                        ? Column(
                            children: [
                              SizedBox(
                                height: Get.height * .5,
                              ),
                              Text(AppStrings.nodata.tr,
                                  style: AppStyles.semibold20(context)),
                            ],
                          )
                        : Expanded(
                            child: RefreshIndicator(
                                onRefresh: () async {
                                  controller.getBuyData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: GridView.builder(
                                      itemCount: controller.buyData.value?.data
                                              ?.data?.length ??
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
                                          itemData: controller.buyData.value!
                                              .data!.data![index],
                                          onTap: () {
                                            Get.toNamed(Routes.offers,
                                                arguments: {
                                                  'id': controller
                                                      .buyData
                                                      .value!
                                                      .data!
                                                      .data![index]
                                                      .id,
                                                  'title': controller
                                                      .buyData
                                                      .value!
                                                      .data!
                                                      .data![index]
                                                      .cryptoCurrency
                                                      ?.name
                                                });
                                          },
                                        );
                                      }),
                                )),
                          )
            : controller.isLoading.value
                ? Column(
                    children: [
                      SizedBox(
                        height: Get.height * .5,
                      ),
                      const CustomLoader(),
                    ],
                  )
                : controller.isFailSell.value
                    ? Column(
                        children: [
                          SizedBox(
                            height: Get.height * .3,
                          ),
                          RetryWidget(onRetry: () {
                            controller.getSellData();
                          }),
                        ],
                      )
                    : controller.sellData.value?.data?.data?.isEmpty ?? false
                        ? Column(
                            children: [
                              SizedBox(
                                height: Get.height * .5,
                              ),
                              Text(AppStrings.nodata.tr,
                                  style: AppStyles.semibold20(context)),
                            ],
                          )
                        : Expanded(
                            child: RefreshIndicator(
                                onRefresh: () async {
                                  controller.getSellData();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: GridView.builder(
                                      itemCount: controller.sellData.value?.data
                                              ?.data?.length ??
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
                                          itemData: controller.sellData.value!
                                              .data!.data![index],
                                          onTap: () {
                                            Get.toNamed(Routes.offers,
                                                arguments: {
                                                  'id': controller
                                                      .buyData
                                                      .value!
                                                      .data!
                                                      .data![index]
                                                      .id,
                                                  'title': controller
                                                      .buyData
                                                      .value!
                                                      .data!
                                                      .data![index]
                                                      .cryptoCurrency
                                                      ?.name
                                                });
                                          },
                                        );
                                      }),
                                )),
                          ))
      ],
    );
  }
}
