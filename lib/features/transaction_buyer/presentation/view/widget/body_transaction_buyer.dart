import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';
import 'package:horsely_app/features/transaction_buyer/presentation/view/widget/transaction_buyer_tab_bar.dart';

class BodyTransactionBuyer extends StatelessWidget {
  const BodyTransactionBuyer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.25),
                      blurRadius: 4,
                      spreadRadius: -3)
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const TransactionBuyerTabBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    TitleAndWidget(
                        title: AppStrings.conintype.tr,
                        childWidget: CustomAnimatedDropdown(
                          items: const ["InstaPay", "Vodafone Cash"],
                          titiel: AppStrings.choosecoinetype.tr,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleAndWidget(
                        title: AppStrings.availbelcoin.tr,
                        childWidget: const CustomNumericTextFormField(
                          hintText: "",
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleAndWidget(
                        title: AppStrings.currency.tr,
                        childWidget: CustomAnimatedDropdown(
                          items: const ["InstaPay", "Vodafone Cash"],
                          titiel: AppStrings.choosecountry.tr,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleAndWidget(
                        title: AppStrings.amountofcurency.tr,
                        childWidget: const CustomNumericTextFormField(
                          hintText: "",
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleAndWidget(
                        title: AppStrings.paymethod.tr,
                        childWidget: CustomAnimatedDropdown(
                          items: const ["InstaPay", "Vodafone Cash"],
                          titiel: AppStrings.chooseway.tr,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButton(
                        onButtonPressed: () {},
                        buttonText: AppStrings.publish.tr)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
