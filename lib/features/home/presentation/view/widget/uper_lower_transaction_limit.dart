import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/home/presentation/manager/controler/silder_controler.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSliderTranactionWidget extends StatelessWidget {
  const CustomSliderTranactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController controller = Get.put(SliderController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return SfRangeSlider(
            min: 0.0,
            max: 100.0,
            values: SfRangeValues(controller.minValuetranactionlimit.value,
                controller.maxValuetranactionlimit.value),
            interval: 20,
            enableTooltip: true,
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.grey,
            onChanged: (SfRangeValues newValues) {
              // تحديث القيم الأدنى والأعلى باستخدام GetX
              controller.updateValuestranactionlimit(
                  newValues.start, newValues.end);
            },
          );
        }),
      ],
    );
  }
}
