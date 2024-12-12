import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/on_boarding/presentation/manager/controler/on_boarding_controler.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/button_next.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/custom_divider.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/on_boarding_page_view.dart';

class BodyOnBoarding extends StatelessWidget {
  const BodyOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = Get.put(OnBoardingController());

    return Column(
      children: [
        const SizedBox(height: 54),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(() {
            return Row(
              children: List.generate(
                3,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: CustomDivider(
                      isactive: index <= controller.currentPage.value,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: getCurrentLanguage() == "en"
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: GestureDetector(
              onTap: () {
                Get.toNamed(Routes.welcome);
              },
              child: Text(
                AppStrings.skipe.tr,
                style: AppStyles.semibold16(context)
                    .copyWith(color: const Color(0xff707070)),
              ),
            ),
          ),
        ),
        Expanded(
          child: OnBoardingPageview(pageController: controller.pageController),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ButtonNext(controller: controller),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
