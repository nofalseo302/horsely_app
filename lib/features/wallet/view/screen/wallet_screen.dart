import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';
import 'package:horsely_app/features/wallet/view/widget/creat_wallet_buttom.dart';

import 'package:horsely_app/features/wallet/view/widget/header_section.dart';
import 'package:horsely_app/features/wallet/view/widget/header_wallest.dart';

class WalletScreen extends GetView<WalletDataController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: AppStrings.wallet.tr, context: context),
      body: Obx(
        () => controller.isLoading.value
            ? const CustomLoader()
            : controller.isError.value
                ? Center(
                    child: RetryWidget(onRetry: () {
                      controller.getBalance();
                    }),
                  )
                : controller.walletModel.data!.isEmpty
                    ? Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: Get.height * 0.3),
                            child: Center(
                              child: Text(AppStrings.nodata.tr,
                                  style: AppStyles.semibold20(context)),
                            ),
                          ),
                          const Spacer(),
                          const CreateWalletButton()
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            HeaderWallet(
                              net: controller.walletModel.data?[0]
                                      .cryptoCurrency?.net ??
                                  "",
                              blance: controller.walletModel.data?[0].balance
                                      .toString() ??
                                  "",
                              currency: controller.walletModel.data?[0]
                                      .cryptoCurrency?.symbol ??
                                  "",
                            ),
                            const SizedBox(height: 40),
                            HeaderSection(titel: AppStrings.lastTranaction.tr),
                            Expanded(
                                child: Center(
                              child: Text(
                                AppStrings.noTransactionsYet.tr,
                                style: AppStyles.semibold20(context),
                              ),
                            )
                                //  ListView.builder(
                                //   itemBuilder: (BuildContext context, int index) {
                                //     return IteamLastTranaction(
                                //         isincome: index % 2 == 0);
                                //   },
                                // ),
                                )
                          ],
                        ),
                      ),
      ),
    );
  }
}
