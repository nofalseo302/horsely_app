import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/utils/exensions.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/auth/logic/controller/register_controller.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_text_filed.dart';
import 'package:horsely_app/core/widget/password_text_filed.dart';
import 'package:horsely_app/core/widget/phone_wiidget.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

class FormSingUp extends GetView<RegisterController> {
  const FormSingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 10,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Form(
        key: controller.formkey,
        child: Column(
          children: [
            TitleAndWidget(
              title: AppStrings.name.tr,
              childWidget: CustomTextFormField(
                validator: (email) =>
                    AppValidationFunctions.nameValidationFunction(email),
                controller: controller.nameController,
                onSaved: (p1) {},
                hintText: AppStrings.name.tr,
                textInputType: TextInputType.name,
              ),
            ),
            const SizedBox(height: 16),
            TitleAndWidget(
              title: AppStrings.email.tr,
              childWidget: CustomTextFormField(
                validator: (email) =>
                    AppValidationFunctions.emailValidationFunction(email),
                controller: controller.emailController,
                onSaved: (p0) {},
                hintText: AppStrings.email.tr,
                textInputType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 16),
            TitleAndWidget(
              title: AppStrings.phone.tr,
              childWidget: MobileTextfiled(
                validator: (value) =>
                    AppValidationFunctions.phoneValidationFunction(value),
                title: AppStrings.phone.tr,
                controller: controller.phoneController,
                countryController: controller.countryCodeController,
              ),
            ),
            const SizedBox(height: 16),
            TitleAndWidget(
              title: AppStrings.password.tr,
              childWidget: PasswordField(
                validator: (email) =>
                    AppValidationFunctions.passwordValidationFunction(email),
                controller: controller.passwordController,
                onSaved: (p0) {},
              ),
            ),
            const SizedBox(height: 16),
            TitleAndWidget(
              title: AppStrings.comfrimpassword.tr,
              childWidget: PasswordField(
                validator: (email) {
                  if (email!.isEmpty) {
                    return Get.locale!.languageCode == 'ar'
                        ? 'كلمه السر  لا يمكن أن يكون فارغًا!'
                        : "password can't be empty!";
                  }
                  if (controller.passwordController.text !=
                      controller.confirmPasswordController.text) {
                    return AppStrings.passwordDoesNotMatch.tr;
                  }
                  return null;
                },
                controller: controller.confirmPasswordController,
                onSaved: (p0) {},
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              onButtonPressed: () async {
                if (controller.formkey.currentState!.validate() &&
                    controller.phoneController.text.isNotEmpty) {
                  await controller.register();
                } else {
                  ToastManager.showError(AppStrings.pleaseEnterPhoneNamber.tr);
                }
              },
              buttonText: AppStrings.creataccount.tr,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.alreadyhaveaccount.tr,
                  style: AppStyles.semibold14(context),
                ),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Get.offNamed(Routes.login);
                  },
                  child: Text(
                    AppStrings.login.tr,
                    style: AppStyles.semibold14(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
            const SizedBox(height: 40),
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.privacy);
                },
                child: Text(
                  '''
                    By using the app and logging in, you agree to the Terms of Service and Privacy Policy.
                    ''',
                  textAlign: TextAlign.center,
                  style: AppStyles.semibold12(context)
                      .copyWith(color: const Color(0xff8A8A8A)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
