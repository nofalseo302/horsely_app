import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/logic/controler/tab_bart_controler.dart';
import 'package:horsely_app/features/home/presentation/view/widget/iteam_tap.dart';

class TapBar extends StatelessWidget {
  const TapBar({super.key});

  @override
  Widget build(BuildContext context) {
    final TapBarController controller =
        Get.put(TapBarController()); // إنشاء instance من الـ controller

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => controller.toggleTab(0), // تغيير التاب النشط
                child: Obx(() {
                  return IteamTap(
                    active: controller.activeIndex.value == 0, // تحقق من الحالة
                    title: AppStrings.buy.tr,
                  );
                }),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => controller.toggleTab(1), // تغيير التاب النشط
                child: Obx(() {
                  return IteamTap(
                    active: controller.activeIndex.value == 1, // تحقق من الحالة
                    title: AppStrings.sell.tr,
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
