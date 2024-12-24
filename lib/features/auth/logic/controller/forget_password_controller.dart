import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/widget/custom_loader.dart';
import '../../../../core/widget/toast_manager_widget.dart';
import '../../../../routes/routes.dart';
import '../../data/repo/forget_password_repo.dart';
import '../../data/repo/verfiry_account_repo.dart';

class ForgetPasswordController extends GetxController {
  String codeController = '';
  final ForgetPasswordRepo _forgetPasswordRepo = ForgetPasswordRepo();
  var passwordController = TextEditingController();
  var emailController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  // var newPasswordKormKey = GlobalKey<FormState>();
  final VerfiryAccountRepo _verfiryAccountRepo = VerfiryAccountRepo();

  Timer? timer;
  RxInt seconds = 60.obs;

  Future<void> resendCode() async {
    seconds.value = 60;
    beginTimer();
    await resendCodeToUser();
  }

  RxBool isValid = RxBool(false);

  beginTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds.value > 0) {
          seconds.value--;
        } else {
          timer.cancel();
        }
      },
    );
  }

  Future<void> checkCredential() async {
    startLoading();
    var result = await _forgetPasswordRepo.checkCredential(
        email: emailController.text.trim());
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      Get.toNamed(Routes.verifyAccount, arguments: {
        'email': emailController.text.trim(),
        'isPasswordScreen': true
      });
      ToastManager.showSuccess(r, true);
    });
  }

  Future<void> forgetPasswordCheckOtp({
    String? otp,
  }) async {
    startLoading();
    var result = await _forgetPasswordRepo.forgetPasswordCheckOtp(
      otp: otp ?? codeController.trim(),
      email: emailController.text.trim(),
    );
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      Get.toNamed(Routes.restpassword, arguments: {
        "otp": otp ?? codeController.trim(),
      });
      ToastManager.showSuccess(r, true);
    });
  }

  Future<void> resetPassword() async {
    String otp = Get.arguments['otp'];
    startLoading();
    var result = await _forgetPasswordRepo.resetPassword(
      email: emailController.text.trim(),
      otp: otp,
      password: passwordController.text.trim(),
      passwordConfirmation: confirmPasswordController.text.trim(),
    );
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) {
      Get.offAllNamed(Routes.login);
      ToastManager.showSuccess(r.message.toString(), true);
    });
  }

  Future<void> resendCodeToUser() async {
    startLoading();
    var result = await _verfiryAccountRepo.resendCode();
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      ToastManager.showSuccess(r, true);
    });
  }

  @override
  void onInit() async {
    beginTimer();
    super.onInit();
  }
}
