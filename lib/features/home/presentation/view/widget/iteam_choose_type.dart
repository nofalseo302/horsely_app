import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/home/logic/controler/buttom_sheet_controler.dart';

class IteamChooseType extends StatelessWidget {
  final int index; // تحديد العنصر بناءً على الفهرس

  const IteamChooseType({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final ItemTypeController controller = Get.find<ItemTypeController>();

    return GestureDetector(
      onTap: () {
        controller.selectItem(index); // تحديث العنصر المختار عند الضغط
      },
      child: Obx(
        () => Row(
          children: [
            Text(
              "USDT",
              style: AppStyles.semibold16(context),
            ),
            const Spacer(),
            // تحديد الأيقونة بناءً على ما إذا كان العنصر نشطًا
            SvgPicture.asset(
              controller.selectedItem.value == index
                  ? AppImages.active // الأيقونة النشطة
                  : AppImages.notactive, // الأيقونة غير النشطة
            ),
          ],
        ),
      ),
    );
  }
}
