import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';

import '../../../../../core/utils/app_text_styles.dart';

class BodyWelcome extends StatelessWidget {
  const BodyWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(104, 104, 104, 0), // Transparent gray
            Color.fromRGBO(2, 2, 2, 0.375), // Semi-transparent black
            Color.fromRGBO(2, 2, 2, 0.375), // Semi-transparent black
            Color.fromRGBO(2, 2, 2, 0.375), // Semi-transparent black
            Color.fromRGBO(2, 2, 2, 0.375), // Semi-transparent black
          ],
          stops: [
            0.0,
            0.5,
          ],
        ),
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.welcomebackground),
          fit:
              BoxFit.cover, // استخدام BoxFit.cover لجعل الصورة تغطي كامل الشاشة
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SafeArea(
              child: Text(
                AppStrings.welcome.tr,
                style: AppStyles.semibold32(context),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              AppStrings.trackpitcons.tr,
              style: AppStyles.semibold16(context)
                  .copyWith(color: const Color(0xffCACACA)),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffffffff).withOpacity(.05),
                border: Border.all(color: Colors.white.withOpacity(.04)),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomButton(
                        onButtonPressed: () {
                          Get.toNamed(Routes.login);
                        },
                        buttonText: AppStrings.login.tr),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onButtonPressed: () {
                        Get.toNamed(Routes.register.tr);
                      },
                      buttonText: AppStrings.singup.tr,
                      backgroundColor: Colors.transparent,
                      borderColor: const Color(0xffE8E8E8),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
