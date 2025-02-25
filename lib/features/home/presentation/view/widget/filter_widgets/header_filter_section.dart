import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class HeaderFilterSection extends StatelessWidget {
  const HeaderFilterSection(
      {super.key, this.onPressed, required this.titeel, required this.showAll});
  final void Function()? onPressed;
  final String titeel;
  final bool showAll;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        children: [
          Text(
            titeel,
            style: AppStyles.semibold18(context),
          ),
          const Spacer(),
          Text(
            showAll ? AppStrings.viewless.tr : AppStrings.viewall.tr,
            style: AppStyles.semibold14(context).copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          //const SizedBox(width: 5),
          Icon(getCurrentLanguage() == "ar"
              ? Icons.keyboard_arrow_left
              : Icons.keyboard_arrow_right),
        ],
      ),
    );
  }
}
