import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/on_boarding/entity/page_view_iteam_entity.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/iteam_page_view.dart';

class OnBoardingPageview extends StatelessWidget {
  const OnBoardingPageview({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      
      children: [
        IteamPageView(
            pageViewIteamEntity: PageViewIteamEntity(
                image: AppImages.onboarding1,
                titel: AppStrings.exploreAndInvest.tr,
                complettitel: AppStrings.inmarket.tr,
                diferrenttitel: AppStrings.topCryptoCur.tr,
                subtitel: AppStrings.subtitelpageview1.tr)),
        IteamPageView(
            pageViewIteamEntity: PageViewIteamEntity(
                image: AppImages.onboarding2,
                titel: AppStrings.exploreAndInvest.tr,
                complettitel: AppStrings.inmarket.tr,
                diferrenttitel: AppStrings.topCryptoCur.tr,
                subtitel: AppStrings.subtitelpageview1.tr)),
        IteamPageView(
            pageViewIteamEntity: PageViewIteamEntity(
                image: AppImages.onboarding3,
                titel: AppStrings.exploreAndInvest.tr,
                complettitel: AppStrings.inmarket.tr,
                diferrenttitel: AppStrings.topCryptoCur.tr,
                subtitel: AppStrings.subtitelpageview1.tr)),
      ],
    );
  }
}
