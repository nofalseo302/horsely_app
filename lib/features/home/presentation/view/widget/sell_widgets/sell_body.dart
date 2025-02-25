import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_skeletonizer.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy.dart';

class SellDataBody extends GetView<HomeControler> {
  const SellDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomLoadingAnimation(
        state: controller.isLoading.value
            ? currentState.loading
            : controller.sellData.value?.data?.data == null
                ? currentState.failure
                : controller.sellData.value!.data!.data!.isEmpty
                    ? currentState.empty
                    : currentState.success,
        onFail: () async {
          controller.getSellData(requestModel: HomeDataRequest(offerType: OfferType.sell));
        },
        animationType: AnimationType.skeletonizer,
        enable: controller.isLoading.value,
        widget: ListView.builder(
            key: ValueKey<int>(
                controller.activeIndex.value), // مفتاح لتفادي الأخطاء
            itemCount: controller.sellData.value?.data?.data?.length ??
                0, // عدد العناصر
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IteamBuy(
                  itemData: controller.sellData.value!.data!.data![index],
                  isbay: false,
                  nameButttom: AppStrings.sell.tr,
                  onTap: () {
                    Get.toNamed(Routes.selldetails);
                  },
                )))));
  }
}
