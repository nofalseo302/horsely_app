import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/features/account/features/pincode/logic/controler/pin_code_controler.dart';

import 'package:horsely_app/features/account/features/pincode/presentation/widget/body_pin.dart';
import 'package:horsely_app/features/account/features/pincode/presentation/widget/creat_pin_code.dart';

class PinCode extends GetView<PinCodeControler> {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundScaffold,
      appBar: buildAppBar(titel: AppStrings.pincode.tr, context: context),
      body: Obx(() => controller.isFirstTime.value.isEmpty
          ? const CreatPinCode()
          : const PincodeBody()),
    );
  }
}
