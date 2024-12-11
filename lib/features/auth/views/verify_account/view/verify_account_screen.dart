import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/auth/logic/controller/otp_controller.dart';

import 'package:horsely_app/features/auth/views/verify_account/widget/body_verify.dart';

class VerifyAccountScreen extends GetView<OtpController> {
  const VerifyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
    return Scaffold(
      body: BodyVerifyAccount(goToHome: controller.isPasswordScreen),
    );
  }
}
