import 'dart:async';
import 'dart:convert';

import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';

import '../../../../core/widget/custom_loader.dart';
import '../../../../routes/routes.dart';
import '../../data/model/user_model.dart';
import '../../data/repo/verfiry_account_repo.dart';

class OtpController extends GetxController {
  final VerfiryAccountRepo _verfiryAccountRepo = VerfiryAccountRepo();
  TextEditingController codeController = TextEditingController();
  Future<void> resendCode() async {
    await resendCodeToUser();
  }

  RxBool isValid = false.obs;

  Future<void> verfiyAccount() async {
    startLoading();
    var result = await _verfiryAccountRepo.verfiryAccount(code: '1234'
        //TODO to be Changed later
        // codeController.text.trim(),
        );
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      Get.offAllNamed(Routes.home);
      // UserService.to.setUser(r);
      ToastManager.showSuccess(r, true);
    });
  }

  Future<void> resendCodeToUser() async {
    finshed.value = false;
    startLoading();
    var result = await _verfiryAccountRepo.resendCode();
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l.message, false);
    }, (r) async {
      ToastManager.showSuccess(r, true);
    });
  }

  String email = '';
  takeEmail() {
    try {
      email = (CashHelper.getData(CacheKeys.userModel) == null
          ? Get.arguments['email']
          : UserModel.fromJson(
                  json.decode(CashHelper.getData(CacheKeys.userModel)))
              .data
              ?.email
              .toString())!;
    } catch (e) {
      email = '';
    }
  }

  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  bool isPasswordScreen = true;
  @override
  void onInit() async {
    try {
      isPasswordScreen = Get.arguments['isPasswordScreen'] ?? false;
    } catch (e) {
      isPasswordScreen = true;
    }

    await takeEmail();
    super.onInit();
  }

  @override
  void dispose() {
    email = '';
    finshed.value = false;
    super.dispose();
  }

  @override
  void onClose() {
    email = '';
    finshed.value = false;
    super.onClose();
  }

  RxBool finshed = false.obs;
}
