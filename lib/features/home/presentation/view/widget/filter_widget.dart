import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/home/presentation/manager/controler/silder_controler.dart';
import 'package:horsely_app/features/home/presentation/view/widget/header_filter_buttom_sheet.dart';
import 'package:horsely_app/features/home/presentation/view/widget/header_filter_section.dart';
import 'package:horsely_app/features/home/presentation/view/widget/rating_widget_fa.dart';
import 'package:horsely_app/features/home/presentation/view/widget/shape_choose_iteam.dart';

import 'package:horsely_app/features/home/presentation/view/widget/uper_lower_transaction_limit.dart';
import 'package:horsely_app/features/home/presentation/view/widget/upper_lower_vule_widget.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key, required this.controller});
  final SliderController controller;

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
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Column(
          children: [
            const HeaderFilterButtomSheet(),
            _buildSection(AppStrings.conintype.tr, ['USDT', 'USDT']),
            const Divider(height: 54, color: Color(0xffE6E6E6)),
            _buildSection(AppStrings.curencytype.tr, ['AED', 'AED']),
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
                AppStrings.paymentseected.tr, ['InstaPay', 'InstaPay']),
            const SizedBox(height: 20),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderFilterSection(titeel: title),
        const SizedBox(height: 16),
        Row(
            children: items
                .map((item) => Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8),
                      child: ShapeChoose(titel: item),
                    ))
                .toList()),
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
                onButtonPressed: () => Get.back(),
                buttonText: AppStrings.search.tr)),
        const SizedBox(width: 10),
        Expanded(
            child: CustomButton(
                backgroundColor: AppColors.backgray,
                textColor: Colors.black,
                onButtonPressed: () => Get.back(),
                buttonText: AppStrings.cancel.tr)),
      ],
    );
  }
}
