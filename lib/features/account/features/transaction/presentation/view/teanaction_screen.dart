import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/account/features/myorder/presentation/widget/iteam_order_tap_bar.dart';
import 'package:horsely_app/features/account/features/transaction/logic/controller/transaction_controller.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';

class TeanactionScreen extends GetView<TransactionController> {
  const TeanactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, int> currencyMap = {
      for (var e in controller.allCurrencyModel?.data ?? [])
        if (e.name != null) e.name!: e.id
    };

    final Map<String, int> paymentMap = {
      for (var e in controller.allPaymentMethod?.data ?? [])
        if (e.name != null) e.name!: e.id
    };

    final Map<String, int> coinTypeMap = {
      for (var e in controller.currencyModel?.value.data ?? [])
        if (e.name != null) e.name!: e.id
    };

    return Scaffold(
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Toggle Tabs (Buy / Sell)
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff4d221e0d).withOpacity(.05),
                            borderRadius: BorderRadius.circular(17),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => controller.toggleTab(0),
                                    child: Obx(
                                      () => IteamOrderTapBar(
                                        active:
                                            controller.activeIndex.value == 0,
                                        title: AppStrings.buy.tr,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () => controller.toggleTab(1),
                                    child: Obx(
                                      () => IteamOrderTapBar(
                                        active:
                                            controller.activeIndex.value == 1,
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

                        // Coin Type Dropdown

                        TitleAndWidget(
                          title: AppStrings.conintype.tr,
                          childWidget: Obx(
                            () => CustomAnimatedDropdown(
                              value: coinTypeMap
                                      .containsKey(controller.coinType.value)
                                  ? controller.coinType.value
                                  : null,
                              onChanged: (p0) {
                                if (p0 != null && coinTypeMap.containsKey(p0)) {
                                  controller.coinType.value = p0.toString();
                                  print(controller.coinType.value);
                                  controller.coinType.value =
                                      coinTypeMap[p0].toString();
                                }
                              },
                              items: coinTypeMap.keys.toList(),
                              titiel: AppStrings.conintype.tr,
                            ),
                          ),
                        ),

                        // Available Coin Input
                        CustomTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          title: AppStrings.availbelcoin.tr,
                          hintText: '',
                          spacing: 8,
                          textInputType: TextInputType.number,
                        ),

                        // Currency Dropdown
                        Obx(
                          () => TitleAndWidget(
                            title: AppStrings.conintype.tr,
                            childWidget: CustomAnimatedDropdown(
                              value: currencyMap
                                      .containsKey(controller.currency.value)
                                  ? controller.currency.value
                                  : null,
                              onChanged: (selectedName) {
                                if (selectedName != null &&
                                    currencyMap.containsKey(selectedName)) {
                                  controller.currency.value =
                                      selectedName.toString();
                                  controller.selectedCurrencyId.value =
                                      currencyMap[selectedName].toString();
                                }
                              },
                              items: currencyMap.keys.toList(),
                              titiel: AppStrings.currency.tr,
                            ),
                          ),
                        ),

                        // Amount of Currency Input
                        CustomTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          title: AppStrings.amountofcurency.tr,
                          hintText: '',
                          spacing: 8,
                          textInputType: TextInputType.text,
                        ),
                        CustomTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          title: AppStrings.maxlimit.tr,
                          hintText: '',
                          spacing: 8,
                          textInputType: TextInputType.text,
                        ),
                        CustomTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          title: AppStrings.minlimit.tr,
                          hintText: '',
                          spacing: 8,
                          textInputType: TextInputType.text,
                        ),

                        // Payment Method Dropdown
                        Obx(
                          () => TitleAndWidget(
                            title: AppStrings.paymethod.tr,
                            childWidget: CustomAnimatedDropdown(
                              value: paymentMap
                                      .containsKey(controller.paymethodId.value)
                                  ? controller.paymethodId.value
                                  : null,
                              onChanged: (p0) {
                                if (p0 != null && paymentMap.containsKey(p0)) {
                                  controller.paymethodId.value = p0.toString();
                                }
                              },
                              items: paymentMap.keys.toList(),
                              titiel: AppStrings.paymethod.tr,
                            ),
                          ),
                        ),

                        // Description Input
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onButtonPressed: () {},
          buttonText: AppStrings.publish.tr,
        ),
      ),
    );
  }
}
