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
          return controller.finshed.value
              ? GestureDetector(
                  onTap: () => controller.resendCode(),
                  child: Text(
                    AppStrings.send.tr,
                    style: AppStyles.semibold16(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              : Countdown(
                  seconds: 120,
                  build: (BuildContext context, double time) {
                    int minutes = (time ~/ 60); // استخراج الدقائق
                    int seconds = (time % 60).toInt(); // استخراج الثواني
                    String formattedTime =
                        "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";

                    return Text(
                      formattedTime, // عرض الوقت بتنسيق mm:ss
                      style: AppStyles.semibold16(context)
                          .copyWith(color: AppColors.primaryColor),
                    );
                  },
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
