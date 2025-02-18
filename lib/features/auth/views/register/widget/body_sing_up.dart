import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/exensions.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/auth/logic/controller/register_controller.dart';
import 'package:horsely_app/features/auth/views/register/widget/form_sing_up.dart';
import 'package:horsely_app/routes/routes.dart';

class BodySingUp extends GetView<RegisterController> {
  const BodySingUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          image: AssetImage(
            AppImages.welcomebackgroundWithGradint,
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  Text(
                    AppStrings.creatnewaccount.tr,
                    style: AppStyles.semibold22(context)
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppStrings.filedetails.tr,
                    style: AppStyles.semibold14(context).copyWith(
                      color: AppColors.gray.withOpacity(.9),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: FormSingUp(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.privacy);
                },
                child: Text(
                  AppStrings
                      .byusingtheappandlogginginyouagreetotheTermsofServiceandPrivacyPolicy
                      .tr,
                  textAlign: TextAlign.center,
                  style: AppStyles.semibold12(context)
                      .copyWith(color: const Color(0xff8A8A8A)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
    // child: Stack(
    //   clipBehavior: Clip.none,
    //   children: [
    //     const HeaderSingUp(),
    //     Container(
    //       height: MediaQuery.of(context).size.height +
    //           MediaQuery.of(context).size.height * 0.4,
    //     ),
    //     Positioned(
    //       top: MediaQuery.of(context).size.height * 0.25,
    //       left: 0,
    //       right: 0,
    //       child: Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.circular(13),
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Colors.black.withOpacity(.25),
    //                 blurRadius: 10,
    //                 spreadRadius: -5,
    //               )
    //             ],
    //           ),
    //           child: const Padding(
    //             padding: EdgeInsets.symmetric(
    //               horizontal: 16.0,
    //               vertical: 20,
    //             ),
    //             child: FormSingUp(),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
  }
}
