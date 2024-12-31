import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_code_bottom_sheet.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class PinCodeController extends GetxController {
  RxString isFirstTime = ''.obs;
  var isLocalAuth = false.obs;
  var isAuth = false.obs;

  TextEditingController pinCode = TextEditingController();
  TextEditingController newPinCodeController = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> checkLocalAuth() async {
    var result = await auth.canCheckBiometrics;
    isLocalAuth.value = result;
  }

  Future<void> checkAuth() async {
    try {
      auth.getAvailableBiometrics();
      isAuth.value = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: false),
      );
      if (!isAuth.value) {
        Get.back();
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        ToastManager.showError(e.message.toString());
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        ToastManager.showError(e.message.toString());
      } else {
        ToastManager.showError(e.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkFirstPinCode() async {
    String? result = await CashHelper.getData(CacheKeys.pinCode);
    isFirstTime.value = result ?? '';
  }

  void putPinCode() async {
    if (isFirstTime.isEmpty) {
      setPinCode(pinCode: pinCode.text);
      Get.back();
      pinCode.clear();
    } else {
      String result = await CashHelper.getData(
        CacheKeys.pinCode,
      );
      if (result == pinCode.text) {
        pinCode.clear();
        Get.back();
        Get.bottomSheet(const ChangePinCodeBottomSheet());
      } else {
        ToastManager.showError(AppStrings.wrongPinCode.tr);
      }
    }
  }

  setPinCode({
    required String pinCode,
  }) async {
    await CashHelper.setData(CacheKeys.pinCode, pinCode);
    isFirstTime.value = pinCode;
    ToastManager.showSuccess(AppStrings.creatPinCodeSucess.tr, true);
  }

  @override
  void onInit() async {
    var res = await CashHelper.getData(CacheKeys.pinCode);
    if (Get.arguments == null && res != null) {
      await checkFirstPinCode();
      await checkLocalAuth();
      await checkAuth();
    }
    super.onInit();
  }
}
