import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/features/account/features/pincode/logic/controler/pin_code_controller.dart';

class MyButtomSheet extends GetView<PinCodeController> {
  const MyButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.enternewpincode.tr,
                style:
                    AppStyles.semibold32(context).copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              // const PasswordField(),
              CustomTextFormField(
                hintText: '',
                controller: controller.pinCode,
                textInputType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                validator: (p0) =>
                    AppValidationFunctions.validateFourDigitNumber(p0),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onButtonPressed: () {
                  controller.putPinCode();
                },
                buttonText: AppStrings.enter.tr,
                backgroundColor: AppColors.redColor,
                borderColor: AppColors.redColor,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onButtonPressed: () {
                  Get.back();
                },
                buttonText: AppStrings.cancel.tr,
                textColor: Colors.black,
                backgroundColor: AppColors.backGray,
                borderColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
