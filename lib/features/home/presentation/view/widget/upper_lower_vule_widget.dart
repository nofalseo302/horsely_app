import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSliderWidget extends GetView<HomeControler> {
  const CustomSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return SfRangeSlider(
            min: 0.0,
            max: 100000.0,
            values: SfRangeValues(controller.minValuePricesRating.value,
                controller.maxValuepricesRating.value),
            interval: 100,
            enableTooltip: true,
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.grey,
            onChanged: (SfRangeValues newValues) {
              // تحديث القيم الأدنى والأعلى باستخدام GetX
              controller.updateValues(newValues.start, newValues.end);
            },
          );
        }),
      ],
    );
  }
}
