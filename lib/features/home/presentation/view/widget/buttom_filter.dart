import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/home/logic/controler/silder_controler.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_widget.dart';

class ButtonInfilter extends StatelessWidget {
  const ButtonInfilter({super.key});

  @override
  Widget build(BuildContext context) {
    final SliderController controller = Get.put(SliderController());
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      decoration: BoxDecoration(
        border:
            const Border(left: BorderSide(width: 1, color: Color(0xffD9D9D9))),
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Get.bottomSheet(
                  FilterWidget(controller: controller),
                  isScrollControlled:
                      true, // تأكد من أن الـ BottomSheet يمكن أن يتكيف
                );
              },
              icon: Image.asset(AppImages.filter),
            ),
          ],
        ),
      ),
    );
  }
}
