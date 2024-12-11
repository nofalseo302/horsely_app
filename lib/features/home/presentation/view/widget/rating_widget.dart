import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/features/home/presentation/manager/controler/rating_controler.dart';

class CustomRatingBar extends StatelessWidget {
  final int itemCount; // عدد العناصر في البار (النجوم أو غيرها)
  final double itemSize; // حجم العنصر (النجوم)
  final RatingController controller =
      Get.put(RatingController()); // ربط المتحكم

  CustomRatingBar({
    super.key,
    this.itemCount = 5, // القيمة الافتراضية هي 5 نجوم
    this.itemSize = 40.0, // حجم العنصر الافتراضي
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(itemCount, (index) {
          return GestureDetector(
            onTap: () {
              controller.updateRating(index + 1.0); // تحديث التقييم عند الضغط
            },
            child: Icon(
              index < controller.rating.value
                  ? Icons.star
                  : Icons.star_border, // نجمة ممتلئة أو فارغة
              color: index < controller.rating.value
                  ? AppColors.primaryColor
                  : Colors.grey, // لون النجوم
              size: itemSize,
            ),
          );
        }),
      );
    });
  }
}
