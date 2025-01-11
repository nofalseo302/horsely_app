import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/account/features/verification_status/logic/controller/verification_status_controller.dart';
import 'package:horsely_app/features/account/features/verification_status/presentation/widget/approved.dart';
import 'package:horsely_app/features/account/features/verification_status/presentation/widget/pending.dart';

class BodyVerificationStatus extends GetView<VerificationStatusController> {
  const BodyVerificationStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationStatusController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const CustomLoader();
        }
        if (controller.userModel == null) {
          return Center(
            child: RetryWidget(
              onRetry: () async => await controller.getUserData(),
            ),
          );
        }
        if (controller.userModel?.data?.completeDataStatus == 'approved') {
          return const Approved();
        } else {
          return const Pending();
        }
      },
    );
  }
}
