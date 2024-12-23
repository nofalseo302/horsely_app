import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/main.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';

import '../../data/repo/login_repo.dart';

class LoginController extends GetxController {
  RxBool isLogin = true.obs;
  final LoginRepo _loginRepo = LoginRepo();
  var formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login() async {
    startLoading();
    var result = await _loginRepo.login(
        email: emailController.text.trim(),
        mobileCountryCode: "+20",
        password: passwordController.text.trim(),
        fcmToken: 'fcmToken');
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      if (r.data?.isActiveAccount == false) {
        ToastManager.showSuccess(r.message ?? '', true);
        await UserService.to.setUser(r);
        Get.toNamed(
          Routes.verifyAccount,
          arguments: {
            'email': emailController.text.trim(),
            'isPasswordScreen': false,
          },
        );
      } else {
        getRoute(r);
      }
    });
  }
}
