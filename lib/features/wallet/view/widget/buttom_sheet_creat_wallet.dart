import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/wallet_controller.dart';
import 'package:horsely_app/features/wallet/view/widget/iteam_choose_wallet.dart';

class BottomSheetCreatWallet extends GetView<WalletController> {
  const BottomSheetCreatWallet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Obx(
          () => controller.isLoadingcurrency.value
              ? const CustomLoader()
              : controller.isErrorcurrency.value
                  ? Center(
                      child: RetryWidget(onRetry: () {
                        controller.getCryptoCurrency();
                      }),
                    )
                  : controller.cryptoCurrencyModel.data!.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.3),
                          child: Center(
                            child: Text(AppStrings.nodata.tr,
                                style: AppStyles.semibold20(context)),
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(children: [
                            Row(
                              children: [
                                Text(
                                  AppStrings.walletType.tr,
                                  style: AppStyles.semibold32(context).copyWith(
                                      fontSize: 28, color: Colors.black),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: const CircleAvatar(
                                    backgroundColor: AppColors.backGray,
                                    child: Icon(Icons.close),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            ...List.generate(
                                controller.cryptoCurrencyModel.data?.length ??
                                    0,
                                (index) => Obx(
                                      () => IteamChooseWallet(
                                        image: controller.cryptoCurrencyModel
                                                .data?[index].image ??
                                            "",
                                        net: controller.cryptoCurrencyModel
                                                .data?[index].net ??
                                            "",
                                        onTap: () {
                                          controller.choosewallet(
                                              index,
                                              controller.cryptoCurrencyModel
                                                      .data?[index].id ??
                                                  0);
                                        },
                                        name: controller.cryptoCurrencyModel
                                                .data?[index].name ??
                                            "",
                                        isActive:
                                            controller.selindex.value == index,
                                      ),
                                    )),
                            Row(
                              children: [
                                Expanded(
                                    child: CustomButton(
                                        onButtonPressed: () {
                                          Get.back();
                                          controller.createWallet();
                                          controller.selindex.value = -1;
                                        },
                                        buttonText: AppStrings.confrim.tr)),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                    child: CustomButton(
                                        backgroundColor: AppColors.backGray,
                                        borderColor: AppColors.backGray,
                                        textColor: const Color(0xff333333),
                                        onButtonPressed: () {
                                          Get.back();
                                        },
                                        buttonText: AppStrings.cancel.tr))
                              ],
                            )
                          ]),
                        ),
        ),
      ),
    );
  }
}
