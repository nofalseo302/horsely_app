import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class HeaderFilterSection extends StatelessWidget {
  const HeaderFilterSection({
    super.key,
    this.onPressed,
    required this.titeel,
  });
  final void Function()? onPressed;
  final String titeel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titeel,
          style: AppStyles.semibold18(context),
        ),
        const Spacer(),
        Text(
          AppStrings.viewall.tr,
          style: AppStyles.semibold14(context),
        ),
        const SizedBox(width: 5),
        IconButton(
            onPressed: onPressed,
            icon: Icon(getCurrentLanguage() == "ar"
                ? Icons.keyboard_arrow_left
                : Icons.keyboard_arrow_right)),
      ],
    );
  }
}
