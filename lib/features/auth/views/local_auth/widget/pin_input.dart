// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/auth/logic/controller/local_auth_controller.dart';

class PinInput extends GetView<LocalAuthController> {
  const PinInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<LocalAuthController>(
          id: 'pin_input',
          builder: (_) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: controller.selectedNumbers.length > index
                        ? AppColors.primaryColor
                        : AppColors.backGray,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 32),
        GestureDetector(
          onTap: () => controller.forgetPassword(),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backGray,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text("${AppStrings.forgetpassword.tr}"),
          ),
        )
      ],
    );
  }
}
