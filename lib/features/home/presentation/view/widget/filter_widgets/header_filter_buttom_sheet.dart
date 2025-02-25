import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class HeaderFilterButtomSheet extends StatelessWidget {
  const HeaderFilterButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: 1),
        Text(
          AppStrings.filter.tr,
          style: AppStyles.semibold20(context),
        ),
        Text(
          AppStrings.reset.tr,
          style: AppStyles.semibold14(context)
              .copyWith(color: Colors.black.withOpacity(.8)),
        ),
      ],
    );
  }
}
