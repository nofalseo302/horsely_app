import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/on_boarding/presentation/manager/controler/on_boarding_controler.dart';

class ButtonNext extends StatelessWidget {
  const ButtonNext({
    super.key,
    required this.controller,
  });

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Obx(() {
          return controller.currentPage.value >= 1
              ? GestureDetector(
                  onTap: () {
                    if (controller.currentPage.value > 0) {
                      controller.pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.backgray,
                      borderRadius: BorderRadius.circular(17),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                )
              : const SizedBox
                  .shrink(); // إذا لم يكن في الصفحة 2 أو 3، لا تعرض الـ Container
        }),
        const SizedBox(width: 8),
        Expanded(
          child: CustomButton(
            icon: getCurrentLanguage() == "en"
                ? "assets/png/arrow right.png"
                : "assets/png/arback.png",
            buttonText: AppStrings.nextButton.tr,
            onButtonPressed: () {
              if (controller.currentPage.value < 2) {
                controller.pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              } else {
                Get.toNamed(Routes.welcome);
              }
            },
          ),
        ),
      ],
    );
  }
}
