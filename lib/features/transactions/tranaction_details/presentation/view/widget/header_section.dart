import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/history/presentation/view/widget/my_tabel.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  AppStrings.history.tr,
                  style: AppStyles.semibold20(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.history);
                  },
                  child: Text(
                    AppStrings.seeall.tr,
                    style: AppStyles.semibold14(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 20,
            ),
            TabelHistory(data: const [
              ["3:05 PM", "910.10", "+1.21%"],
              ["4:00 PM", "820.50", "+0.95%"],
              ["5:15 PM", "450.75", "-0.50%"],
            ]),
          ],
        ),
      ),
    );
  }
}
