import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/password_text_filed.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

import '../../../logic/controller/login_controller.dart';

class FormLogin extends GetView<LoginController> {
  const FormLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Form(
        key: controller.formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleAndWidget(
                title: AppStrings.email.tr,
                childWidget: CustomTextFormField(
                  hintText: AppStrings.enteremail.tr,
                  textInputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  validator: (email) =>
                      AppValidationFunctions.emailValidationFunction(email),
                )),
            const SizedBox(
              height: 16,
            ),
            TitleAndWidget(
                title: AppStrings.password.tr,
                childWidget: PasswordField(
                  controller: controller.passwordController,
                  onSaved: (p0) {},
                )),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.forgetPassword);
                },
                child: Text(
                  AppStrings.forgetpassword.tr,
                  style: AppStyles.semibold14(context)
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              onButtonPressed: () async {
                if (controller.formkey.currentState!.validate()) {
                  await controller.login();
                }
              },
              buttonText: AppStrings.login.tr,
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.donthaveaccount.tr,
                  style: AppStyles.semibold14(context),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.register);
                  },
                  child: Text(
                    ' ${AppStrings.creataccount.tr} ',
                    style: AppStyles.semibold14(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
