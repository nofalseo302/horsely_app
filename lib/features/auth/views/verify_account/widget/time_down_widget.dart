import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

import 'package:timer_count_down/timer_count_down.dart';

import '../../../logic/controller/otp_controller.dart';

class TimeDown extends GetView<OtpController> {
  const TimeDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() {
          // عرض العداد أو النص "إرسال" بناءً على حالة isFinished
          return controller.finshed.value
              ? GestureDetector(
                  onTap: () => controller.resendCode(),
                  child: Text(
                    AppStrings
                        .send.tr, // النص الذي يظهر عند انتهاء العد التنازلي
                    style: AppStyles.semibold16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              : Countdown(
                  seconds: 60, // المدة الزمنية للعد التنازلي
                  build: (BuildContext context, double time) => Text(
                    time.toStringAsFixed(0), // لتجنب الأرقام العشرية
                    style: AppStyles.semibold16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  interval: const Duration(seconds: 1),
                  onFinished: () {
                    controller.finshed.value = true;
                  },
                );
        }),
      ],
    );
  }
}
