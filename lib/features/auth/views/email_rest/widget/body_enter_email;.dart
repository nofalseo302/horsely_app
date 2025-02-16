import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/icon_back.dart';

import 'package:horsely_app/features/auth/views/email_rest/widget/form_enter_email.dart';

import '../../../logic/controller/forget_password_controller.dart';

class BodyEnterEmail extends GetView<ForgetPasswordController> {
  const BodyEnterEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const IconBack(),
                ),
                const SizedBox(height: 20),
                Text(
                  AppStrings.accountrecvied.tr,
                  style: AppStyles.semibold22(context)
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.accountrecviedinstraction.tr,
                  style: AppStyles.semibold14(context).copyWith(
                    color: AppColors.gray.withOpacity(.9),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.25),
                          blurRadius: 10,
                          spreadRadius: -5)
                    ],
                  ),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: FromEnterEmail(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // child: Stack(
      //   clipBehavior: Clip.none,
      //   children: [
      //     const HeaderEnterEmil(),
      //     Container(
      //       height: MediaQuery.of(context).size.height,
      //     ),
      //     Positioned(
      //       top: MediaQuery.of(context).size.height * 0.3,
      //       left: 0,
      //       right: 0,
      //       child: Form(
      //         key: controller.formKey2,
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //           child: Container(
      //             decoration: BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.circular(13),
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: Colors.black.withOpacity(.25),
      //                   blurRadius: 10,
      //                   spreadRadius: -5,
      //                 )
      //               ],
      //             ),
      //             child: const Padding(
      //               padding: EdgeInsets.symmetric(
      //                 horizontal: 16.0,
      //                 vertical: 20,
      //               ),
      //               child: FromEnterEmail(),
      //             ),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
