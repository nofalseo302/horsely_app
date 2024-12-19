import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/information_user/data/repo/repo/change_password_repo.dart';

class EditPasswordController extends GetxController {
  final ChangePasswordRepo _changePasswordRepo = ChangePasswordRepo();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  changePassword() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      var res = await _changePasswordRepo.changePassword(data: {
        "old_password": currentPasswordController.text,
        "password": newPasswordController.text,
        "password_confirmation": confirmPasswordController.text,
      });
      stopLoading();
      res.fold(
        (l) => ToastManager.showError(l.message),
        (r) {
          Get.back();
          ToastManager.showSuccess(r, true);
        },
      );
    }
  }
}
