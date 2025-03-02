import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/text_filed_builder.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';

class SendBottomSheet extends GetView<WalletDataController> {
  const SendBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 3,
                    spreadRadius: -1)
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.enterdata.tr,
                      style: AppStyles.semibold20(context),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColors.backGray,
                      radius: 20,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
                TextFieldBuilder(
                  title: AppStrings.code.tr,
                  controller: controller.address,
                  validator: (s) {
                    if (s!.isEmpty) return AppStrings.requiredField.tr;
                    return null;
                  },
                ),
                TextFieldBuilder(
                  controller: controller.amount,
                  title: AppStrings.amount.tr,
                  validator: (s) {
                    return AppValidationFunctions.numValidationFunction(
                        s, AppStrings.amount.tr);
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                  onButtonPressed: () {
                    controller.transfer();
                  },
                  buttonText: AppStrings.send.tr,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    textColor: Colors.black,
                    borderColor: Colors.transparent,
                    backgroundColor: AppColors.backGray,
                    onButtonPressed: () {
                      Get.back();
                    },
                    buttonText: AppStrings.close.tr),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
