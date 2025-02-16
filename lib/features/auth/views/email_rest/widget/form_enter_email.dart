import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

import '../../../logic/controller/forget_password_controller.dart';

class FromEnterEmail extends GetView<ForgetPasswordController> {
  const FromEnterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey2,
      child: Column(
        children: [
          TitleAndWidget(
            title: AppStrings.email.tr,
            childWidget: CustomTextFormField(
              validator: (p0) =>
                  AppValidationFunctions.emailValidationFunction(p0),
              controller: controller.emailController,
              hintText: AppStrings.enteremail.tr,
              textInputType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            onButtonPressed: () async {
              if (controller.formKey2.currentState!.validate()) {
                await controller.checkCredential();
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
