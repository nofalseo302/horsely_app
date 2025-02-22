import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';

import 'package:horsely_app/features/wallet/view/widget/header_section.dart';
import 'package:horsely_app/features/wallet/view/widget/header_wallest.dart';
import 'package:horsely_app/features/wallet/view/widget/iteam_last_tranaction.dart';

class WalletScreen extends GetView<BlancController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.wallet.tr, context: context),
      body: Obx(
        () => controller.isLoading.value
            ? const Expanded(child: CustomLoader())
            : controller.isError.value
                ? Center(
                    child: RetryWidget(onRetry: () {
                      controller.getBalance();
                    }),
                  )
                : controller.blancModel.data!.isEmpty
                    ? Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.3),
                        child: Center(
                          child: Text(AppStrings.nodata.tr,
                              style: AppStyles.semibold20(context)),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            HeaderWallet(
                              blance: controller.blancModel.data?[0].balance
                                      .toString() ??
                                  "",
                            ),
                            const SizedBox(height: 40),
                            HeaderSection(titel: AppStrings.lastTranaction.tr),
                            Expanded(
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return IteamLastTranaction(
                                      isincome: index % 2 == 0);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
      ),
    );
  }
}
