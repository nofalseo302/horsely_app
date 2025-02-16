import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/exensions.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/utils/image/custom_image_handler.dart';
import 'package:horsely_app/core/widget/build_app_bar.dart';
import 'package:horsely_app/core/widget/custom_button.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/wallet/logic/controller/wallet_controller.dart';

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
                          child: Text("AppStrings..tr",
                              style: AppStyles.semibold20(context)),
                        )
                      : Expanded(
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
                                onTap: () {},
                              );
                            },
                          ),
                        ),
        ),
      ),
    );
  }
}

class IteamFristWallet extends StatelessWidget {
  const IteamFristWallet({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 3,
                spreadRadius: -4),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: const Color(0xffE9EFF5).withOpacity(.9),
            radius: 25,
            child: const CustomImageHandler(AppImages.pitcont),
          ),
          title: Text(
            "BTC",
            style: AppStyles.semibold20(context),
          ),
          subtitle: Text(
            "Ethereum",
            style: AppStyles.semibold14(context)
                .copyWith(color: const Color(0xff8A8A8A)),
          ),
          trailing: const Icon(Icons.keyboard_arrow_right),
        ),
      ),
    );
  }
}
