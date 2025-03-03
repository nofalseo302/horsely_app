import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_skeleton.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/crypto_currency.dart';

import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy.dart';

import '../../../../data/model/user_home_data/currency.dart';
import '../../../../data/model/user_home_data/user.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class BuyDataBody extends GetView<HomeControler> {
  const BuyDataBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomSkeletonizer(
          emptyLoadWidget: IteamBuy(
            isbay: false,
            itemData: P2pItem(),
            nameButttom: 'buy',
          ),
          state: controller.state.value,
          onFail: () async {
            controller.activeIndex.value == 1
                ? controller.getBuyData(
                    requestModel: HomeDataRequest(offerType: OfferType.buy))
                : controller.getSellData(
                    requestModel: HomeDataRequest(offerType: OfferType.sell));
          },
          child: ListView.builder(
              key: ValueKey<int>(
                  controller.activeIndex.value), // مفتاح لتفادي الأخطاء
              itemCount: controller.buyData.value?.data?.data?.length ??
                  0, // عدد العناصر
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: IteamBuy(
                      itemData: controller.buyData.value!.data!.data![index],
                      isbay: true,
                      nameButttom: AppStrings.sell.tr,
                      onTap: () {
                        Get.toNamed(Routes.buydetails,
                            arguments:
                                controller.buyData.value!.data!.data![index]);
                      }))),
        ));
  }
}
