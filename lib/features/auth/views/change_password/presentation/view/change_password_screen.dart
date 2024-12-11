import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'package:horsely_app/features/auth/views/change_password/presentation/view/widget/body_Change_password.dart';

import '../../../../logic/controller/forget_password_controller.dart';

class ChangePassword extends GetView<ForgetPasswordController> {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F7),
      appBar: buildAppBar(titel: AppStrings.accountseting.tr, context: context),
      body: const BodyChangePassword(),
    );
  }
}
