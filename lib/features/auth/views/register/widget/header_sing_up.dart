import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/auth/views/login/widget/clipe_from_buttom.dart';

class HeaderSingUp extends StatelessWidget {
  const HeaderSingUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalBottomClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height * .45,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.welcomebackground),
            fit: BoxFit.cover, // لجعل الصورة تغطي كامل العرض والارتفاع
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Text(
                  AppStrings.creataccount.tr,
                  style: AppStyles.semibold20(context)
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.filedetails.tr,
                  style: AppStyles.semibold14(context)
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
