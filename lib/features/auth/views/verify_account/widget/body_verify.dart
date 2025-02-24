import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/auth/logic/controller/forget_password_controller.dart';
import 'package:horsely_app/features/auth/views/verify_account/widget/otp_verifaction.dart';
import 'package:horsely_app/features/auth/views/verify_account/widget/time_down_widget.dart';

import '../../../logic/controller/otp_controller.dart';
import 'header_verify.dart';

class BodyVerifyAccount extends GetView<OtpController> {
  final bool goToHome;

  const BodyVerifyAccount({super.key, required this.goToHome});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const HeaderVerify(),
          Container(height: MediaQuery.of(context).size.height),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.32,
            left: 0,
            right: 0,
            child: Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        FittedBox(
                            child: OtpVerifaction(onChange: (p0) {
                          controller.isValid.value = p0.length == 6;
                        }, onSubmit: (s) {
                          controller.codeController.text = s;
                        })),
                        const SizedBox(height: 30),
                        Obx(
                          () => CustomButton(
                            enabled: controller.isValid.value,
                            onButtonPressed: () async {
                              if (controller.formKey.currentState!.validate()) {
                                if (controller.isPasswordScreen) {
                                  Get.find<ForgetPasswordController>()
                                      .forgetPasswordCheckOtp(
                                          otp: controller.codeController.text);
                                  return;
                                }
                                await controller.verfiyAccount();
                              }
                            },
                            buttonText: AppStrings.continuee.tr,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.rensendcode.tr,
                              style: AppStyles.semibold16(context)
                                  .copyWith(color: const Color(0xff545454)),
                            ),
                            const SizedBox(width: 10),
                            const TimeDown(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
