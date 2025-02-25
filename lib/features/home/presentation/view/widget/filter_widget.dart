import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';

import 'package:horsely_app/features/home/presentation/view/widget/header_filter_buttom_sheet.dart';
import 'package:horsely_app/features/home/presentation/view/widget/header_filter_section.dart';
import 'package:horsely_app/features/home/presentation/view/widget/rating_widget_fa.dart';
import 'package:horsely_app/features/home/presentation/view/widget/shape_choose_iteam.dart';

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
            ? CustomLoader()
            : controller.isfail.value
                ? RetryWidget(onRetry: () {})
                : SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 30),
                    child: Column(
                      children: [
                        const HeaderFilterButtomSheet(),
                        _buildSection(
                            number: 1,
                            AppStrings.conintype.tr,
                            cryptoCurrencyModel:
                                controller.cryptoCurrencyModel),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        _buildSection(
                            number: 2,
                            AppStrings.curencytype.tr,
                            allCurrencyModel: controller.allCurrencyModel),
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
                        const RatingWidget(),
                        const RatingWidget(),
                        const RatingWidget(),
                        const Divider(height: 54, color: Color(0xffE6E6E6)),
                        _buildSection(
                            number: 3,
                            AppStrings.paymentseected.tr,
                            allpaymodel: controller.allPaymentMethod),
                        const SizedBox(height: 20),
                        _buildButtons(context),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget _buildSection(
    String title, {
    required int number,
    AllCurrencyModel? allCurrencyModel,
    AllPaymentMethod? allpaymodel,
    CryptoCurrencyModel? cryptoCurrencyModel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderFilterSection(titeel: title),
        const SizedBox(height: 16),
        Wrap(
            children: List.generate(
                number == 1
                    ? cryptoCurrencyModel?.data?.length ?? 0
                    : number == 2
                        ? allCurrencyModel?.data?.length ?? 0
                        : allpaymodel?.data?.length ?? 0,
                (index) => Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: GestureDetector(
                            
                            child: ShapeChoose(
                              titel: number == 1
                                  ? cryptoCurrencyModel!.data![index].name!
                                  : number == 2
                                      ? allCurrencyModel!.data![index].name!
                                      : allpaymodel!.data![index].name!,
                            ),
                          )),
                    )))
      ],
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
