// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/iteam_order_tap_bar.dart';
import 'package:horsely_app/features/account/features/transaction/logic/controller/transaction_controller.dart';
import 'package:horsely_app/features/account/features/transaction/presentation/widget/body_tranaction.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';

class TeanactionScreen extends GetView<TransactionController> {
  const TeanactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                  color: const Color(0xff4d221e0d).withOpacity(.05),
                  borderRadius: BorderRadius.circular(17)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.toggleTab(0),
                        child: Obx(() {
                          return IteamOrderTapBar(
                            active: controller.activeIndex.value == 0,
                            title: AppStrings.buy.tr,
                          );
                        }),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => controller.toggleTab(1),
                        child: Obx(() {
                          return IteamOrderTapBar(
                            active: controller.activeIndex.value == 1,
                            title: AppStrings.sell.tr,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Obx(
              () => TitleAndWidget(
                title: AppStrings.conintype.tr,
                childWidget: CustomAnimatedDropdown(
                  value: controller.coinType.value.isEmpty
                      ? null
                      : controller.coinType.value,
                  onChanged: (p0) => controller.coinType.value = p0.toString(),
                  items: const ["USDT", "BTC"],
                  titiel: AppStrings.conintype.tr,
                ),
              ),
            ),
            CustomTextFormField(
              title: AppStrings.availbelcoin.tr,
              hintText: '',
              spacing: 8,
              textInputType: TextInputType.number,
            ),
            Obx(
              () => TitleAndWidget(
                title: AppStrings.currency.tr,
                childWidget: CustomAnimatedDropdown(
                  value: controller.currency.value.isEmpty
                      ? null
                      : controller.currency.value,
                  onChanged: (p0) => controller.currency.value = p0.toString(),
                  items: const ['EGY', 'AED'],
                  titiel: AppStrings.currency.tr,
                ),
              ),
            ),
            CustomTextFormField(
              title: AppStrings.amountofcurency.tr,
              hintText: '',
              spacing: 8,
              textInputType: TextInputType.text,
            ),
            Obx(
              () => TitleAndWidget(
                title: AppStrings.paymethod.tr,
                childWidget: CustomAnimatedDropdown(
                  value: controller.paymethod.value.isEmpty
                      ? null
                      : controller.paymethod.value,
                  onChanged: (p0) => controller.paymethod.value = p0.toString(),
                  items: const ['Cash', 'Vodafone cash'],
                  titiel: AppStrings.paymethod.tr,
                ),
              ),
            ),
            CustomTextFormField(
              title: AppStrings.description.tr,
              hintText: '',
              spacing: 8,
              maxLines: 5,
              textInputType: TextInputType.text,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onButtonPressed: () {},
          buttonText: AppStrings.publish,
        ),
      ),
    );
  }
}
