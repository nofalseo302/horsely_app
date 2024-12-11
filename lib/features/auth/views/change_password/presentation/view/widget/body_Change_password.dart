import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';

import '../../../../../../../core/widget/password_text_filed.dart';
import '../../../../../logic/controller/forget_password_controller.dart';

class BodyChangePassword extends GetView<ForgetPasswordController> {
  const BodyChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 4,
            spreadRadius: -3)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 9),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TitleAndWidget(
                  title: AppStrings.curentpassword.tr,
                  childWidget:
                      PasswordField(controller: controller.passwordController)),
              const SizedBox(
                height: 16,
              ),
              TitleAndWidget(
                  title: AppStrings.newspassword.tr,
                  childWidget: PasswordField(
                      controller: controller.confirmPasswordController)),
              const SizedBox(
                height: 16,
              ),
              TitleAndWidget(
                  title: AppStrings.comfrimnewpassword.tr,
                  childWidget: const PasswordField()),
              const Spacer(),
              CustomButton(
                  onButtonPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      await controller.resetPassword();
                    }
                  },
                  buttonText: AppStrings.save.tr),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
