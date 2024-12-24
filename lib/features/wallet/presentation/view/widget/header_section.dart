import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/lasttranaction/presentation/view/last_tranaction.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({
    super.key,
    required this.titel,
  });
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.semibold18(context),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.to(const LastTranaction());
          },
          child: Text(
            AppStrings.seeall.tr,
            style: AppStyles.semibold14(context)
                .copyWith(color: AppColors.primaryColor),
          ),
        )
      ],
    );
  }
}
