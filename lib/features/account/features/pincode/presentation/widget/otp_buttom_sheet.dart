import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/account/features/pincode/logic/controler/pin_code_controller.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_code_bottom_sheet.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/opt.dart';

class OtpButtomSheet extends GetView<PinCodeController> {
  const OtpButtomSheet({
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
                "OTP",
                // Get.arguments.toString(),
                style:
                    AppStyles.semibold32(context).copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${AppStrings.sendcodemeasagge.tr} 010****020",
                style: AppStyles.semibold14(context),
              ),
              const SizedBox(
                height: 24,
              ),
              Opt(onSubmit: (vule) {}),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onButtonPressed: () {
                  var arg = Get.arguments;
                  Get.back();
                  Get.bottomSheet(
                    const ChangePinCodeBottomSheet(),
                    settings: RouteSettings(
                      name: "localAuth",
                      arguments: arg,
                    ),
                  );
                },
                buttonText: AppStrings.continuee.tr,
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
                backgroundColor: AppColors.backgray,
                borderColor: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
