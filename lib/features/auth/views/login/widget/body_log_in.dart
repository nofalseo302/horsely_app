import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';

import 'package:horsely_app/features/auth/views/login/widget/form_login.dart';

class BodyLogin extends StatelessWidget {
  const BodyLogin({super.key});

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
                height: MediaQuery.of(context).size.height * .07,
              ),
              Text(
                AppStrings.login.tr,
                style:
                    AppStyles.semibold24(context).copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                AppStrings.subtitellogin.tr,
                style: AppStyles.semibold16(context)
                    .copyWith(color: Colors.white.withOpacity(.9)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .07,
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
                  child: FormLogin(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
