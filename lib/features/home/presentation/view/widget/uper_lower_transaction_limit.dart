import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomSliderTranactionWidget extends GetView<HomeControler> {
  const CustomSliderTranactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return SfRangeSlider(
            min: 0.0,
            max: 100.0,

            values: SfRangeValues(
              controller.minValuetranactionlimit.value,
              controller.maxValuetranactionlimit.value,
            ),
            interval: 20,
            labelPlacement: LabelPlacement.onTicks,

            enableIntervalSelection: true,
            showTicks: false,
            enableTooltip: true,
            // tooltipShape: const SfPaddleTooltipShape(),
            minorTicksPerInterval: 100,
            activeColor: AppColors.primaryColor,
            inactiveColor: Colors.grey,
            onChanged: (SfRangeValues newValues) {
              controller.updateValuestranactionlimit(
                  newValues.start, newValues.end);
            },
          );
        }),
      ],
    );
  }
}
