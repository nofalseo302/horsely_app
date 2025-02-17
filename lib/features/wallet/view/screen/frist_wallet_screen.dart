import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/wallet_controller.dart';
import 'package:horsely_app/features/wallet/view/widget/iteam_frist_wallet.dart';
import 'package:horsely_app/routes/routes.dart';

class FristWalletScreen extends GetView<WalletController> {
  const FristWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return Scaffold(
      backgroundColor: AppColors.backGray,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: CustomButton(
          buttonText: 'Create new Wallet',
          onButtonPressed: () {
            controller.createWallet();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Obx(
          () => controller.isLoading.value
              ? const Expanded(child: CustomLoader())
              : controller.isError.value
                  ? RetryWidget(onRetry: () async => await controller.getData())
                  : controller.getAllWalletModel.data!.data!.isEmpty
                      ? Padding(
                          padding: EdgeInsets.only(top: Get.height * 0.3),
                          child: Center(
                            child: Text(AppStrings.nowallet.tr,
                                style: AppStyles.semibold20(context)),
                          ),
                        )
                      : ListView.separated(
                          controller: controller.scrollController,
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 16,
                          ),
                          padding: const EdgeInsets.all(16),
                          itemCount:
                              controller.getAllWalletModel.data?.data?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            return IteamFristWallet(
                              onTap: () {
                                Get.toNamed(Routes.walletScreen,
                                    arguments: controller.getAllWalletModel.data
                                        ?.data?[index].id);
                              },
                            );
                          },
                        ),
        ),
      ),
    );
  }
}
