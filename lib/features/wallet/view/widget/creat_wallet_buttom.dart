import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/features/wallet/logic/controller/wallet_controller.dart';
import 'package:horsely_app/features/wallet/view/widget/buttom_sheet_creat_wallet.dart';

class CreateWalletButton extends GetView<WalletController> {
  const CreateWalletButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: CustomButton(
        buttonText: AppStrings.createNewWallet.tr,
        onButtonPressed: () {
          controller.getCryptoCurrency();
          Get.bottomSheet(
            const BottomSheetCreatWallet(),
          );
        },
      ),
    );
  }
}
