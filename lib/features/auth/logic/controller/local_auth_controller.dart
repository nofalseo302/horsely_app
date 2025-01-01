// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/otp_buttom_sheet.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class LocalAuthController extends GetxController {
  List<String> selectedNumbers = [];
  final LocalAuthentication auth = LocalAuthentication();

  addToSelectedNumbers(String number) {
    if (selectedNumbers.length < 4) {
       selectedNumbers.add(number);
      update(['pin_input']);
      if (selectedNumbers.length == 4) {
        var pin = selectedNumbers.join('');
        var storedPin = CashHelper.getData(CacheKeys.pinCode);
        if (pin == storedPin) {
          Get.offAllNamed(Routes.home);
        } else {
          ToastManager.showError(AppStrings.wrongPinCode.tr);
        }
        selectedNumbers.clear();
      }
    }
  }

  removeFromSelectedNumbers() {
    if (selectedNumbers.isNotEmpty) {
      selectedNumbers.removeLast();
      update(['pin_input']);
    }
  }

  forgetPassword() {
    Get.bottomSheet(
      const OtpButtomSheet(),
      settings: RouteSettings(
        name: 'localAuth',
        arguments: true,
      ),
    );
  }

  Future<void> checkAuth() async {
    try {
      var isAuth = await auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
            stickyAuth: true, useErrorDialogs: false),
      );
      if (isAuth) {
        Get.offAllNamed(Routes.home);
      }
    } on PlatformException catch (e) {
      if (e.code == auth_error.notEnrolled) {
        // Add handling of no hardware here.
        print("object");
      } else if (e.code == auth_error.lockedOut ||
          e.code == auth_error.permanentlyLockedOut) {
        // ...
        print(e.code);
      } else {
        print(e.code);
        // ...
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> onInit() async {
    checkAuth();
    super.onInit();
  }
}
