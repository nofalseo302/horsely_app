import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/comfrimation_buttom_sheet.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/header_buttom_sheet.dart';

class ButtomSheetData extends StatelessWidget {
  const ButtomSheetData({
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
            children: [
              const SizedBox(
                height: 30,
              ),
              HeaderButtomSheet(
                titel: AppStrings.enterdata.tr,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                  hintText: AppStrings.pincode.tr,
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 12,
              ),
              CustomTextFormField(
                  hintText: AppStrings.amount.tr,
                  textInputType: TextInputType.number),
              const SizedBox(
                height: 30,
              ),
              CustomButton(
                  onButtonPressed: () {
                    Get.back();
                    Get.bottomSheet(
                      const ConfroationButtomSheet(),
                    );
                  },
                  buttonText: AppStrings.send.tr),
              const SizedBox(
                height: 16,
              ),
              CustomButton(
                onButtonPressed: () {
                  Get.back();
                },
                buttonText: AppStrings.close.tr,
                backgroundColor: AppColors.backgray,
                borderColor: Colors.transparent,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
