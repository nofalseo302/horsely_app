import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';

import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_drop_down_Singel.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/bay_details/logic/controller/buy_details_controller.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/comfrim_buttom_sheet.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/seller_info.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';
import 'package:horsely_app/features/home/presentation/view/widget/drop_dawn.dart';
import 'package:horsely_app/features/home/presentation/view/widget/information_iteam_buy.dart';

class BodyBuyDetailsScreen extends GetView<BuyDetailsController> {
  const BodyBuyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              SellerInformation(item: controller.dataItem!),
              const SizedBox(
                height: 8,
              ),
              Infromation(
                p2pItem: controller.dataItem!,
              ),
              const SizedBox(
                height: 20,
              ),
              TitleAndWidget(
                  title: AppStrings.enteramount.tr,
                  childWidget: CustomNumericTextFormField(
                    validator: (p0) {
                      if ((p0 ?? "").isEmpty)
                        return AppStrings.requiredField.tr;

                      return null;
                    },
                    hintText: AppStrings.amount.tr,
                    prefix: const Icon(Icons.attach_money_rounded),
                  )),
              const SizedBox(
                height: 16,
              ),
              TitleAndWidget(
                  title: AppStrings.theamountofcurency.tr,
                  childWidget: CustomNumericTextFormField(
                    validator: (p0) {
                      if ((p0 ?? "").isEmpty)
                        return AppStrings.requiredField.tr;

                      return null;
                    },
                    hintText: AppStrings.theamountofcurency.tr,
                  )),
              const SizedBox(
                height: 16,
              ),
              TitleAndWidget(
                title: AppStrings.paymentseected.tr,
                childWidget: CustomDropDownFormField(
                  icon: Icon(Icons.keyboard_arrow_down),
                  hintText: AppStrings.paymentseected.tr,
                  validator: (p0) =>
                      AppValidationFunctions.stringValidationFunction(
                          p0, AppStrings.conintype.tr),
                  items: (controller.dataItem?.paymentMethod ?? [])
                      .map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency.name, // ✅ Set the correct unique value
                      child: Text(
                        currency.name ?? "",
                        style: AppStyles.regulare10(context).copyWith(
                          fontSize: 14,
                          color: const Color(0xff00070D),
                          fontWeight: FontWeight.w500,
                          fontFamily: "DIN Next",
                        ),
                      ),
                    );
                  }).toList(),
                  value: controller.selectedCurrencyId.value.isNotEmpty
                      ? controller.selectedCurrencyId.value
                      : null, // ✅ Ensure selected value exists in the list
                  onChanged: (newValue) {
                    if (newValue != null) {
                      controller.selectedCurrencyId.value = newValue;
                      for (var e in controller.dataItem?.paymentMethod ?? []) {
                        if (e.name == newValue) {
                          controller.cerid.value = e.id.toString();

                          print(controller.cerid);
                        }
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  onButtonPressed: () {
                    if (controller.formKey.currentState!.validate())
                      Get.bottomSheet(const ComfrimButtomSheet());
                  },
                  buttonText: AppStrings.buy.tr),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
