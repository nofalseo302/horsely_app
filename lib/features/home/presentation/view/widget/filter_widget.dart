import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/check_chips_widget.dart';

import 'package:horsely_app/features/home/presentation/view/widget/filter_widgets/header_filter_buttom_sheet.dart';

import 'package:horsely_app/features/home/presentation/view/widget/uper_lower_transaction_limit.dart';
import 'package:horsely_app/features/home/presentation/view/widget/upper_lower_vule_widget.dart';

class FilterWidget extends GetView<HomeControler> {
  const FilterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35), topRight: Radius.circular(35)),
      ),
      child: Obx(
        () => controller.isLoadingpay.value
            ? const CustomLoader()
            : controller.allCurrencyModel?.data == null ||
                    controller.cryptoCurrencyModel?.data == null ||
                    controller.allPaymentMethod?.data == null
                ? RetryWidget(onRetry: () {
                    controller.getAllPaymentData();
                  })
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: Column(
                      children: [
                        HeaderFilterButtomSheet(
                          onTap: () {
                            controller.resetFilter();
                            controller.update();
                          },
                        ),
                        CheckChipsWidget(
                          onSelected: (id) {
                            controller.selectedCoinTypes.contains(id)
                                ? controller.selectedCoinTypes.remove(id)
                                : controller.selectedCoinTypes.add(id);
                          },
                          allChips: ChipData.chipDataFromCryptoCurrencyModel(
                              controller.cryptoCurrencyModel!),
                          selectedIds: controller.selectedCoinTypes,
                          title: AppStrings.conintype.tr,
                        ),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        CheckChipsWidget(
                          onSelected: (id) {
                            controller.selectedAllCurrency.contains(id)
                                ? controller.selectedAllCurrency.remove(id)
                                : controller.selectedAllCurrency.add(id);
                          },
                          allChips: ChipData.chipDataFromAllCurrency(
                              controller.allCurrencyModel!),
                          selectedIds: controller.selectedAllCurrency,
                          title: AppStrings.curencytype.tr,
                        ),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        _buildRangeSection(
                            AppStrings.pricesransee.tr,
                            controller.minValuePricesRating,
                            controller.maxValuepricesRating),
                        const CustomSliderWidget(),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        _buildRangeSection(
                            AppStrings.transactionlimite.tr,
                            controller.minValuetranactionlimit,
                            controller.maxValuetranactionlimit),
                        const CustomSliderTranactionWidget(),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        // const RatingWidget(),
                        // const RatingWidget(),
                        // const RatingWidget(),
                        // const Divider(height: 54, color: Color(0xffE6E6E6)),
                        CheckChipsWidget(
                          onSelected: (id) {
                            controller.selectedAllPayment.contains(id)
                                ? controller.selectedAllPayment.remove(id)
                                : controller.selectedAllPayment.add(id);
                          },
                          allChips: ChipData.chipDataFromAllPayment(
                              controller.allPaymentMethod!),
                          selectedIds: controller.selectedAllPayment,
                          title: AppStrings.paymethod.tr,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                    onButtonPressed: () {
                                      Get.back();
                                      controller.activeIndex == 0
                                          ? controller.getSellData(
                                              requestModel: HomeDataRequest(
                                                  offerType: OfferType.buy,
                                                  minLimit: controller.minValuetranactionlimit.value
                                                      .toInt(),
                                                  maxLimit: controller
                                                      .maxValuetranactionlimit
                                                      .value
                                                      .toInt(),
                                                  minPrice: controller.minValuePricesRating.value
                                                      .toInt(),
                                                  maxPrice: controller
                                                      .maxValuepricesRating
                                                      .value
                                                      .toInt(),
                                                  paymentMethods: controller
                                                      .selectedAllPayment,
                                                  currencyType: controller
                                                      .selectedAllCurrency,
                                                  coinType: controller
                                                      .selectedCoinTypes))
                                          : controller.getBuyData(
                                              requestModel: HomeDataRequest(
                                                
                                                  offerType: OfferType.sell,
                                                  minLimit: controller.minValuetranactionlimit.value.toInt(),
                                                  maxLimit: controller.maxValuetranactionlimit.value.toInt(),
                                                  minPrice: controller.minValuePricesRating.value.toInt(),
                                                  maxPrice: controller.maxValuepricesRating.value.toInt(),
                                                  paymentMethods: controller.selectedAllPayment,
                                                  currencyType: controller.selectedAllCurrency,
                                                  coinType: controller.selectedCoinTypes));
                                    },
                                    buttonText: AppStrings.search.tr),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: CustomButton(
                                    backgroundColor: AppColors.backGray,
                                    borderColor: AppColors.backGray,
                                    textColor: AppColors.black,
                                    onButtonPressed: () {
                                      Get.back();
                                    },
                                    buttonText: AppStrings.cancel.tr),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildRangeSection(
      String title, Rx<double> minValue, Rx<double> maxValue) {
    return Row(
      children: [
        Text(title, style: AppStyles.semibold18(Get.context!)),
        const Spacer(),
        Obx(() => Text(
            "${minValue.value.toStringAsFixed(0)} - ${maxValue.value.toStringAsFixed(0)} AED",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black))),
      ],
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: CustomButton(
                backgroundColor: AppColors.backGray,
                textColor: Colors.black,
                onButtonPressed: () => Get.back(),
                buttonText: AppStrings.cancel.tr)),
        const SizedBox(width: 10),
        Expanded(
            child: CustomButton(
                onButtonPressed: () => Get.back(),
                buttonText: AppStrings.search.tr)),
      ],
    );
  }
}
