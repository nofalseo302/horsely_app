import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_validation_functions.dart';
import 'package:horsely_app/core/widget/titel_widget.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/change_password_controller.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/image_controller.dart';
import '../../../../../core/widget/password_text_filed.dart';

class BodyChangePassword extends GetView<EditPasswordController> {
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
                  childWidget: PasswordField(
                      validator: (p0) {
                        return AppValidationFunctions
                            .passwordValidationFunction(p0);
                      },
                      controller: controller.currentPasswordController)),
              const SizedBox(height: 16),
              TitleAndWidget(
                  title: AppStrings.newspassword.tr,
                  childWidget: PasswordField(
                      controller: controller.newPasswordController)),
              const SizedBox(height: 16),
              TitleAndWidget(
                  title: AppStrings.comfrimnewpassword.tr,
                  childWidget: PasswordField(
                    controller: controller.confirmPasswordController,
                    validator: (p0) {
                      if (p0 != controller.newPasswordController.text) {
                        return AppStrings.passwordDoesNotMatch.tr;
                      }
                      return null;
                    },
                  )),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
