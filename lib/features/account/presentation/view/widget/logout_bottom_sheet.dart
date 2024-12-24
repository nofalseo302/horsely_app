import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/routes/routes.dart';

class LogoutBottomSheet extends StatelessWidget {
  const LogoutBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: const BoxDecoration(
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
                child: Text(
                  AppStrings.areYouSureToLogOut.tr,
                  style: Get.textTheme.labelSmall!.copyWith(
                      color: const Color(0xff020202),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              // GestureDetector(
              //   onTap: () => Get.back(),
              //   child: Container(
              //     padding: const EdgeInsets.all(10),
              //     decoration: const BoxDecoration(
              //       color: Color(0xffE9EFF5),
              //       shape: BoxShape.circle,
              //     ),
              //     child: const Icon(Icons.close),
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 30),
          CustomButton(
            buttonText: AppStrings.logout.tr,
            backgroundColor: AppColors.redColor,
            onButtonPressed: () {
              // controller.logout();
              Navigator.pop(context);
              CashHelper.sharedPreferences?.clear();
              UserService.to.currentUser = null;
              Get.offAllNamed(Routes.login);
            },
          ),
          const SizedBox(height: 8),
          CustomButton(
            buttonText: AppStrings.no.tr,
            backgroundColor: const Color(0xffE9EFF5),
            textColor: AppColors.black,
            onButtonPressed: () {
              Get.back();
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
