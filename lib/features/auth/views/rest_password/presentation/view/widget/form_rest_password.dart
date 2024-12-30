import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/password_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

import '../../../../../logic/controller/forget_password_controller.dart';

class FormRestPassword extends GetView<ForgetPasswordController> {
  const FormRestPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordController());
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          TitleAndWidget(
              title: AppStrings.newspassword.tr,
              childWidget: PasswordField(
                validator: (p0) =>
                    AppValidationFunctions.passwordValidationFunction(p0),
                controller: controller.passwordController,
              )),
          const SizedBox(
            height: 16,
          ),
          TitleAndWidget(
              title: AppStrings.comfrimnewpassword.tr,
              childWidget: PasswordField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return Get.locale!.languageCode == 'ar'
                        ? 'كلمة المرور لا يمكن ان تكون فارغة !'
                        : "Password can't be empty";
                  } else if (controller.passwordController.text !=
                      controller.confirmPasswordController.text) {
                    return Get.locale!.languageCode == 'ar'
                        ? 'كلمة المرور غير متطابقة'
                        : "Password doesn't match";
                  }
                  return null;
                },
                controller: controller.confirmPasswordController,
              )),
          const SizedBox(height: 30),
          CustomButton(
            onButtonPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                await controller.resetPassword();
              }
            },
            buttonText: AppStrings.confrim.tr,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
