import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/auth/data/repo/register_repo.dart';

import '../../../../routes/routes.dart';

class RegisterController extends GetxController {
  RxBool isLogin = true.obs;
  final RegisterRepo _registerRepo = RegisterRepo();
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: '+20');
  TextEditingController confirmPasswordController = TextEditingController();
  Future<void> register() async {
    startLoading();
    var result = await _registerRepo.register(
        phoneNumber: phoneController.text.trim(),
        countryCode: countryCodeController.text.trim(),
        name: nameController.text.trim(),
        confirmpassword: confirmPasswordController.text.trim(),
        date: '2000-12-08 11:50:22',
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        fcmToken: 'fcmToken');
    stopLoading();
    result.fold((l) {
      ToastManager.showError(l.message);
    }, (r) async {
      ToastManager.showSuccess(r.message ?? '', true);

      await UserService.to.setUser(r);
      Get.toNamed(
        Routes.verifyAccount,
        arguments: {
          'email': emailController.text.trim(),
          'isPasswordScreen': false,
        },
      );
    });
  }
}
