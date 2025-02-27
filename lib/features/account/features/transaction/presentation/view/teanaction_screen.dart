import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_drop_down_Singel.dart';
import 'package:horsely_app/core/widget/custom_drop_down_muiltabel.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/iteam_order_tap_bar.dart';
import 'package:horsely_app/features/account/features/transaction/logic/controller/transaction_controller.dart';

class TeanactionScreen extends GetView<TransactionController> {
  const TeanactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: buildAppBar(titel: AppStrings.transaction.tr, context: context),
      body: Obx(
        () => controller.isolating.value
            ? const CustomLoader()
            : controller.isfail.value
                ? Center(
                    child: RetryWidget(onRetry: () async {
                      await controller.getAllCurrency();
                      await controller.getAllPayment();
                      await controller.getCryptoCurrency();
                    }),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: AppColors.backGroundScaffold,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Form(
                            key: controller.globalKey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 8,
                                ),
                                // Toggle Tabs (Buy / Sell)
                                Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xff4d221e0d)
                                        .withOpacity(.05),
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () =>
                                                controller.toggleTab(0),
                                            child: Obx(
                                              () => IteamOrderTapBar(
                                                active: controller
                                                        .activeIndex.value ==
                                                    0,
                                                title: AppStrings.buy.tr,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () =>
                                                controller.toggleTab(1),
                                            child: Obx(
                                              () => IteamOrderTapBar(
                                                active: controller
                                                        .activeIndex.value ==
                                                    1,
                                                title: AppStrings.sell.tr,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),

                                TitleAndWidget(
                                  title: AppStrings.conintype.tr,
                                  childWidget: CustomDropDownFormField(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    validator: (p0) => AppValidationFunctions
                                        .stringValidationFunction(
                                            p0, AppStrings.conintype.tr),
                                    items: controller.currencyModel.value.data
                                        ?.map((currency) {
                                      return DropdownMenuItem<String>(
                                        value: currency
                                            .symbol, // ✅ Set the correct unique value
                                        child: Text(
                                          currency.symbol ?? "",
                                          style: AppStyles.regulare10(context)
                                              .copyWith(
                                            fontSize: 14,
                                            color: const Color(0xff00070D),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "DIN Next",
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    value: controller
                                            .selectedCurrencyId.value.isNotEmpty
                                        ? controller.selectedCurrencyId.value
                                        : null, // ✅ Ensure selected value exists in the list
                                    onChanged: (newValue) {
                                      if (newValue != null) {
                                        controller.selectedCurrencyId.value =
                                            newValue;
                                        for (var e in controller
                                                .currencyModel.value.data ??
                                            []) {
                                          if (e.name == newValue) {
                                            controller.cerid.value =
                                                e.id.toString();

                                            print(controller.cerid);
                                          }
                                        }
                                      }
                                    },
                                  ),
                                ),

                                // Available Coin Input
                                CustomTextFormField(
                                  validator: (p0) {
                                    return AppValidationFunctions
                                        .numValidationFunction(
                                            p0, AppStrings.availbelcoin.tr);
                                  },
                                  controller: controller.price,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d*$'))
                                  ],
                                  title: AppStrings.availbelcoin.tr,
                                  hintText: '',
                                  spacing: 8,
                                  textInputType: TextInputType.number,
                                ),

                                TitleAndWidget(
                                  title: AppStrings.currency.tr,
                                  childWidget: CustomDropDownFormField(
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    validator: (p0) => AppValidationFunctions
                                        .stringValidationFunction(
                                            p0, AppStrings.currency.tr),
                                    items: controller.allCurrency.value.data
                                        ?.map((currency) {
                                      return DropdownMenuItem<String>(
                                        value: currency.name,
                                        child: Text(
                                          currency.name ?? "",
                                          style: AppStyles.regulare10(context)
                                              .copyWith(
                                            fontSize: 14,
                                            color: const Color(0xff00070D),
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "DIN Next",
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    value: controller.currency.value.isNotEmpty
                                        ? controller.currency.value
                                        : null,
                                    onChanged: (newValue) {
                                      if (newValue != null) {
                                        controller.currency.value = newValue;
                                      }
                                      for (var e in controller
                                              .allCurrency.value.data ??
                                          []) {
                                        if (e.name == newValue) {
                                          controller.currencyId.value =
                                              e.id.toString();
                                        }
                                      }
                                    },
                                  ),
                                ),

                                // Amount of Currency Input
                                CustomTextFormField(
                                  validator: (p0) => AppValidationFunctions
                                      .numValidationFunction(
                                          p0, AppStrings.amountofcurency.tr),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d*$'))
                                  ],
                                  title: AppStrings.amountofcurency.tr,
                                  hintText: '',
                                  spacing: 8,
                                  controller: controller.amount,
                                  textInputType: TextInputType.text,
                                ),
                                CustomTextFormField(
                                  validator: (p0) => AppValidationFunctions
                                      .nummaxValidationFunction(
                                          p0, AppStrings.maxlimit.tr),
                                  controller: controller.uper,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d*$'))
                                  ],
                                  title: AppStrings.maxlimit.tr,
                                  hintText: '',
                                  spacing: 8,
                                  textInputType: TextInputType.text,
                                ),
                                CustomTextFormField(
                                  validator: (p0) {
                                    if (p0!.isEmpty) {
                                      return AppStrings.thisFieldIsRequired.tr;
                                    } else if (controller.uper.text.isEmpty) {
                                      return null;
                                    }
                                    if ((int.tryParse(
                                                controller.uper.text.trim()) ??
                                            0) <=
                                        (int.tryParse(
                                                controller.limit.text.trim()) ??
                                            0)) {
                                      return Get.locale!.languageCode == 'ar'
                                          ? "   الحد الادني يجي ان يكون اقل من الحد الاقصي  "
                                          : "The minimum limit must be less than the maximum limit.";
                                    }
                                    return null;
                                  },
                                  controller: controller.limit,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d*\.?\d*$'))
                                  ],
                                  title: AppStrings.minlimit.tr,
                                  hintText: '',
                                  spacing: 8,
                                  textInputType: TextInputType.text,
                                ),

                                // Payment Method Dropdown
                                TitleAndWidget(
                                  title: AppStrings.paymethod.tr,
                                  childWidget: CustomDropDownMultiSelect(
                                    onSelect: (s) => (controller
                                        .selectedPaymentMethods
                                        .value = controller
                                            .allPaymentMethod?.data
                                            ?.where((e) => s.contains(e.name))
                                            .toList() ??
                                        []),
                                    initialValue: (controller
                                            .selectedPaymentMethods
                                            .map((e) => e.name!)
                                            .toList() ??
                                        []),
                                    nameOfAllOptions: controller
                                            .allPaymentMethod?.data
                                            ?.map((e) => e.name)
                                            .toList() ??
                                        [],
                                  ),
                                ),

                                CustomTextFormField(
                                  validator: (p0) => AppValidationFunctions
                                      .stringValidationFunction(
                                          p0, AppStrings.description.tr),
                                  controller: controller.decoration,
                                  title: AppStrings.description.tr,
                                  hintText: '',
                                  spacing: 8,
                                  maxLines: 5,
                                  textInputType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onButtonPressed: () {
            if (controller.globalKey.currentState!.validate() &&
                controller.selectedPaymentMethods.isNotEmpty) {
              controller.CreatbayAndSell();
            } else if (controller.selectedPaymentMethods.isEmpty) {
              ToastManager.showError(AppStrings.mustBeChoosePaymentMethod.tr);
            }
          },
          buttonText: AppStrings.publish.tr,
        ),
      ),
    );
  }
}
