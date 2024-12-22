import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/password_text_filed.dart';
import 'package:horsely_app/features/account/delete_account/logic/delete_accout_controller.dart';

class ConfirmPasswordBottomSheet extends GetView<DeleteAccountController> {
  const ConfirmPasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // DeleteAccountController controller = Get.find<DeleteAccountController>();
    return GetBuilder<DeleteAccountController>(
      init: DeleteAccountController(),
      builder: (controller) {
        return SingleChildScrollView(
          child: Container(
            width: Get.width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Text(
                        AppStrings.enterThePasswordToDelete.tr,
                        style: Get.textTheme.labelSmall!.copyWith(
                          color: const Color(0xff020202),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xffE9EFF5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.close),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                PasswordField(
                  controller: controller.passwordCtrl,
                  validator: (value) {
                    return AppValidationFunctions.passwordValidationFunction(
                        value);
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        buttonText: AppStrings.deleteaccount.tr,
                        backgroundColor: AppColors.redColor,
                        textColor: AppColors.white,
                        onButtonPressed: () async {
                          // print("object");

                          await controller.deleteAccount();

                          // Logic to delete the account
                        },
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: CustomButton(
                        buttonText: AppStrings.cancel.tr,
                        backgroundColor: const Color(0xffE9EFF5),
                        textColor: AppColors.black,
                        onButtonPressed: () => Get.back(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
