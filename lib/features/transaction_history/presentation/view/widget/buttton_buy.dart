import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ButtonBayAnd extends StatelessWidget {
  const ButtonBayAnd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xff17875C).withOpacity(.1),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Text(
          AppStrings.buy.tr,
          style: AppStyles.semibold12(context)
              .copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }
}
