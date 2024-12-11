import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_namber_text_filed.dart';
import 'package:horsely_app/features/pincode/presentation/view/widget/otp_buttom_sheet.dart';

class MyButtomSheet extends StatelessWidget {
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
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 42,
              ),
              Text(
                "PIN ${AppStrings.pincode.tr}",
                style:
                    AppStyles.semibold32(context).copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomNumericTextFormField(
                hintText: "",
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
                onButtonPressed: () {
                  Get.back();
                  Get.bottomSheet(const OtpButtomSheet());
                },
                buttonText: AppStrings.enter.tr,
                backgroundColor: Colors.red,
                borderColor: Colors.red,
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
