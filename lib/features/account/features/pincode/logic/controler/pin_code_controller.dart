import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_code_bottom_sheet.dart';
import 'package:local_auth/local_auth.dart';

class PinCodeController extends GetxController {
  RxString isFirstTime = ''.obs;
  var isLocalAuth = false.obs;
  var isAuth = false.obs;

  TextEditingController pinCode = TextEditingController();
  TextEditingController newPinCodeController = TextEditingController();

  final LocalAuthentication auth = LocalAuthentication();

  Future<void> checkLocalAuth() async {
    isLocalAuth.value = await auth.canCheckBiometrics;
  }

  Future<void> checkAuth() async {
    isAuth.value = await auth.authenticate(
      localizedReason: 'Scan your fingerprint to authenticate',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }

  Future<void> checkFirstPinCode() async {
    String? result = await CashHelper.getData(CacheKeys.pinCode);
    isFirstTime.value = result ?? '';
    print(isFirstTime.value);
  }

  void putPinCode() async {
    print(isFirstTime.value);
    if (isFirstTime.isEmpty) {
      setPinCode(
          pinCode: newPinCodeController.text.isEmpty
              ? pinCode.text
              : newPinCodeController.text);
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
    print("pass");
    ToastManager.showSuccess(AppStrings.creatPinCodeSucess.tr, true);
  }

  @override
  void onInit() async {
    print(await CashHelper.getData(CacheKeys.pinCode));
    await checkFirstPinCode();
    super.onInit();
  }
}
