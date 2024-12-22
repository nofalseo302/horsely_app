import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/delete_account/data/delete_account.dart';
import 'package:horsely_app/routes/routes.dart';

class DeleteAccountController extends GetxController {
  final DeleteAccountRepo _changePasswordRepo = DeleteAccountRepo();
  TextEditingController passwordCtrl = TextEditingController();

  var formkey = GlobalKey<FormState>();
  Future<void> deleteAccount() async {
    startLoading();
    var result =
        await _changePasswordRepo.deleteAccount(password: passwordCtrl.text);
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) {
      Get.offAllNamed(Routes.login);
      CashHelper.sharedPreferences?.clear();
      UserService.to.currentUser = null;
      ToastManager.showSuccess(r, true);
    });
  }
}
