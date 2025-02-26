import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/features/on_boarding/intro%20screen/presentation/view/widget/slider_button.dart';
import 'package:horsely_app/routes/routes.dart';

class BodyIntro extends StatelessWidget {
  const BodyIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.intro),
          fit:
              BoxFit.cover, // استخدام BoxFit.cover لجعل الصورة تغطي كامل الشاشة
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.transparent,
            Colors.transparent,
            Colors.black54,
            Colors.black54,
            Colors.black87
          ],
        )),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const SizedBox(
              height: 8,
            ),
            const Spacer(),
            const CustomImageHandler(
              AppImages.whiteLogo,
            ),
            const SizedBox(height: 10),
            Text('Horsely',
                style: AppStyles.semibold32(context)
                    .copyWith(color: AppColors.backGray)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Text(AppStrings.welcomeToHorsly.tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.regulare16(context)
                      .copyWith(color: AppColors.backGray)),
            ),
            SliderButton(
                width: Get.width * 0.8,
                height: 60,
                onSlideComplete: () {
                  Get.toNamed(Routes.welcome);
                }),
            const SizedBox(
              height: 20,
            )
            // Directionality(
            //   textDirection: TextDirection.ltr,
            //   child: Center(
            //       child: SliderButton

            //       SliderButton(
            //           buttonWidth: 150,
            //           height: 60,
            //           dismissThresholds: 0.7,

            //           // buttonSize: 300,
            //           action: () async {
            //             Get.toNamed(Routes.welcome);
            //             return null;

            //             ///Do something here OnSlide
            //             // return false;
            //           },
            //           highlightedColor: Colors.white,
            //           baseColor: Colors.grey,
            //           backgroundColor: Colors.white38,
            //           label: const Text(
            //             "> > >",
            //             style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.w500,
            //                 fontSize: 24),
            //           ),
            //           child: Card(
            //               shape: const StadiumBorder(),
            //               child: Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 30, vertical: 10),
            //                   child: Text(
            //                     AppStrings.start.tr,
            //                     style: const TextStyle(
            //                       color: Color(0xff4D221E),
            //                       fontWeight: FontWeight.w400,
            //                       fontSize: 20,
            //                     ),
            //                   ))))),
            // ),
          ],
        ),
      ),
    );
  }
}
