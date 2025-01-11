// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/exensions.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/auth/views/local_auth/widget/number_pad.dart';
import 'package:horsely_app/features/auth/views/local_auth/widget/pin_input.dart';
import 'package:horsely_app/routes/routes.dart';

class LocalAuth extends StatelessWidget {
  const LocalAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leadingWidth: 100,
        leading: TextButton(
          onPressed: () {
            CashHelper.sharedPreferences!.clear();
            Get.offAllNamed(Routes.onBoarding);
          },
          child: Text(
            AppStrings.logout.tr,
            style: context.textTheme.bodySmall!.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.bgGrey,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CustomImageHandler(
                AppImages.logo,
                fit: BoxFit.fitWidth,
              ),
            ),
            SizedBox(height: 15.h),

            Expanded(
              child: Text(
                AppStrings.localAuth.tr,
                style: context.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Spacer(),
            PinInput(),
            SizedBox(height: 30.h),
            NumberPad(),
          ],
        ),
      ),
    );
  }
}
