import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/on_boarding/entity/page_view_iteam_entity.dart';
import 'package:horsely_app/features/on_boarding/presentation/manager/controler/on_boarding_controler.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/widget/custom_divider.dart';

class IteamPageView extends GetView<OnBoardingController> {
  const IteamPageView({super.key, required this.pageViewIteamEntity});
  final PageViewIteamEntity pageViewIteamEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              child: Image.asset(pageViewIteamEntity.image),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 16),
                  child: CustomDivider(
                    isactive: index == controller.currentPage.value,
                  ),
                ),
              ),
            );
          }),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(.06),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30))),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: pageViewIteamEntity.titel,
                            style: AppStyles.semibold24(context)
                                .copyWith(color: AppColors.black)),
                        TextSpan(
                            text: pageViewIteamEntity.diferrenttitel,
                            style: AppStyles.semibold24(context)
                                .copyWith(color: AppColors.primaryColor)),
                        TextSpan(
                            text: pageViewIteamEntity.complettitel,
                            style: AppStyles.semibold24(context)
                                .copyWith(color: AppColors.black)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      textAlign: TextAlign.start,
                      pageViewIteamEntity.subtitel,
                      style: AppStyles.semibold16(context)
                          .copyWith(color: AppColors.black.withOpacity(0.7)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
