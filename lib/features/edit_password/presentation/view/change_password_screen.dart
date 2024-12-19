import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/information_user/presentation/controler/change_password_controller.dart';

import 'package:horsely_app/features/edit_password/presentation/view/widget/body_Change_password.dart';

import '../../../../core/widget/custom_button.dart';

class EditPasswordScreen extends GetView<EditPasswordController> {
  const EditPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditPasswordController());
    return Scaffold(
      backgroundColor: const Color(0xffF1F5F7),
      appBar: buildAppBar(titel: AppStrings.accountseting.tr, context: context),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: CustomButton(
            onButtonPressed: () async {
              if (controller.formKey.currentState!.validate()) {
                await controller.changePassword();
              }
            },
            buttonText: AppStrings.save.tr),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 5),
        child: BodyChangePassword(),
      )),
    );
  }
}
