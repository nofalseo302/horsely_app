import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/icon_back.dart';
import 'package:horsely_app/features/auth/views/login/widget/clipe_from_buttom.dart';

class HeaderRestPassword extends StatelessWidget {
  const HeaderRestPassword({
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
            image: AssetImage(AppImages.welcomebackgroundWithGradint),
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
                  height: 40,
                ),
                const IconBack(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStrings.newspassword.tr,
                  style: AppStyles.semibold22(context)
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  AppStrings.newspasswordinstraction.tr,
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
