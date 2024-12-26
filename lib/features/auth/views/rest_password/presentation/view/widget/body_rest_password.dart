import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/icon_back.dart';

import 'package:horsely_app/features/auth/views/rest_password/presentation/view/widget/form_rest_password.dart';
import 'package:horsely_app/features/auth/views/rest_password/presentation/view/widget/header_rest_password.dart';

class BodyRestPassword extends StatelessWidget {
  const BodyRestPassword({super.key});

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
              const IconBack(),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.newspassword.tr,
                style:
                    AppStyles.semibold22(context).copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppStrings.newspasswordinstraction.tr,
                style:
                    AppStyles.semibold14(context).copyWith(color: Colors.white),
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
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                  child: FormRestPassword(),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // return SingleChildScrollView(
    //   child: Stack(
    //     clipBehavior: Clip.none,
    //     children: [
    //       const HeaderRestPassword(),
    //       Container(
    //         height: MediaQuery.of(context).size.height,
    //       ),
    //       Positioned(
    //         top: MediaQuery.of(context).size.height * 0.32,
    //         left: 0,
    //         right: 0,
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
    //               child: FormRestPassword(),
    //             ),
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
