import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_bottom_sheet.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/change_pin_code_bottom_sheet.dart';

class PinCodeControler extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await checkFirstPinCode();
  }

  RxString isFirstTime = ''.obs;
  Future<void> checkFirstPinCode() async {
    String? result = await CashHelper.getData(CacheKeys.pinCode);
    isFirstTime.value = result ?? '';
    print(isFirstTime.value);
  }
  //-------------------------------------put pin code veribel and fu nctions

  TextEditingController pinCode = TextEditingController();

  void putPinCode() async {
    if (isFirstTime.isEmpty) {
      await CashHelper.setData(CacheKeys.pinCode, pinCode.text);
      Get.back();
      pinCode.clear();
      ToastManager.showSuccess(AppStrings.creatPinCodeSucess.tr, true);
    } else {
      String result = await CashHelper.getData(
        CacheKeys.pinCode,
      );
      if (result == pinCode.text) {
        Get.bottomSheet(const ChangePinCodeBottomSheet());
        Get.back();
      } else {
        ToastManager.showError(AppStrings.wrongPinCode.tr);
      }
    }
  }
}
