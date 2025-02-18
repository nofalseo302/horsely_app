import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/settings/privacyAndPolicy/logic/controller/privacy_and_policy_controller.dart';

import '../../../../core/utils/app_colors.dart';

class PrivacyPolicyScreen extends GetView<PrivacyAndPolicyController> {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGray,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        // leading: const Padding(
        //   padding: EdgeInsetsDirectional.only(start: 10, top: 10, bottom: 10),
        //   child: CustomBackButtonWidget(
        //     size: 15,
        //     color: Color(0xFFE9EFF5),
        //   ),
        // ),
        title: Text(
          AppStrings.privacyPolicy.tr,
          style: Get.textTheme.labelSmall!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        child: Builder(
          builder: (context) {
            return Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (controller.hasError.value) {
                return Center(
                  child: RetryWidget(
                    onRetry: () async => await controller.getPolicy(),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Html(
                      data: "${controller.policy}",
                      style: {
                        '*': Style(
                          fontSize: FontSize(16),
                          fontWeight: FontWeight.w400,
                        )
                      },
                    ),
                  ),
                );
              }
            });
          },
        ),
        onRefresh: () async {
          await controller.getPolicy();
        },
      ),
    );
  }
}
