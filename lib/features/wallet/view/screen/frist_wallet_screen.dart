import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/wallet_controller.dart';
import 'package:horsely_app/features/wallet/view/widget/creat_wallet_buttom.dart';
import 'package:horsely_app/features/wallet/view/widget/iteam_frist_wallet.dart';
import 'package:horsely_app/routes/routes.dart';

class FristWalletScreen extends GetView<WalletController> {
  const FristWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return Scaffold(
      backgroundColor: AppColors.backGray,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () => controller.isLoading.value
              ? const CustomLoader()
              : controller.isError.value
                  ? Center(
                      child: RetryWidget(
                          onRetry: () async => await controller.getData()))
                  : controller.getAllWalletModel.data!.data!.isEmpty
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: Get.height * 0.3),
                              child: Center(
                                child: Text(AppStrings.nowallet.tr,
                                    style: AppStyles.semibold20(context)),
                              ),
                            ),
                            const Spacer(),
                            const CreateWalletButton()
                          ],
                        )
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.separated(
                                controller: controller.scrollController,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: 16,
                                ),
                                padding: const EdgeInsets.all(16),
                                itemCount: controller
                                        .getAllWalletModel.data?.data?.length ??
                                    0,
                                itemBuilder: (context, index) {
                                  return IteamFristWallet(
                                    currency: controller.getAllWalletModel.data!
                                        .data![index].cryptoCurrency!,
                                    onTap: () {
                                      Get.toNamed(Routes.walletScreen,
                                          arguments: controller
                                              .getAllWalletModel
                                              .data
                                              ?.data?[index]
                                              .id);
                                    },
                                  );
                                },
                              ),
                            ),
                            const CreateWalletButton(),
                          ],
                        ),
        ),
      ),
    );
  }
}
