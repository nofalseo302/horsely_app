import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_skeleton.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy.dart';

class SellDataBody extends GetView<HomeControler> {
  const SellDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomSkeletonizer(
      emptyWidget: Center(
                        child: Text(
                      AppStrings.nodata.tr,
                      style: AppStyles.semibold20(context),
                    )),
        emptyLoadWidget: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => IteamBuy(
                isbay: false, itemData: P2pItem(), nameButttom: "sell")),
        state: controller.sellState.value,
        onFail: () async {
          controller.getSellData(
              requestModel: HomeDataRequest(offerType: OfferType.sell));
        },
        child: ListView.builder(
            key: ValueKey<int>(
                controller.activeIndex.value), // مفتاح لتفادي الأخطاء
            itemCount: controller.sellData.value?.data?.data?.length ??
                0, // عدد العناصر
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: IteamBuy(
                  itemData: controller.sellData.value!.data!.data![index],
                  isbay: false,
                  nameButttom: AppStrings.buy.tr,
                  onTap: () {
                    Get.toNamed(Routes.buydetails,
                        arguments:
                            controller.sellData.value!.data!.data![index]);
                  },
                )))));
  }
}
