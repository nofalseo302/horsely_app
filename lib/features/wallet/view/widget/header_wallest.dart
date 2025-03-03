import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/wallet/logic/controller/code_Controler.dart';
import 'package:horsely_app/features/wallet/view/widget/send_buttom_sheet.dart';
import 'package:horsely_app/routes/routes.dart';

import 'package:horsely_app/features/wallet/view/widget/iteam_estimlation.dart';
import 'package:horsely_app/features/wallet/view/widget/user_code.dart';

class HeaderWallet extends GetView<WalletDataController> {
  const HeaderWallet(
      {super.key,
      required this.blance,
      required this.net,
      required this.currency});
  final String blance, currency, net;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffB7DACC).withOpacity(.5),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                    image: AssetImage(AppImages.walletBackground),
                    fit: BoxFit.fill)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.estlmatedblance.tr,
                    style: AppStyles.semibold14(context)
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "$currency $blance",
                    style: AppStyles.semibold32(context),
                  ),
                  if (net.isNotEmpty)
                    Text(
                      net,
                      style: AppStyles.semibold24(context)
                          .copyWith(color: AppColors.backGroundScaffold),
                    ),
                  // const SizedBox(
                  //   height: 18,
                  // ),
                  // FittedBox(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       Clipboard.setData(ClipboardData(
                  //           text:
                  //               controller.walletModel.data?[0].address ?? ""));
                  //     },
                  //     child: Text(
                  //       controller.walletModel.data?[0].address ?? "",
                  //       style: AppStyles.semibold16(context)
                  //           .copyWith(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      IteamEstimatedBalnce(
                        onTap: () {
                          Get.toNamed(Routes.withdraw);
                        },
                        image: 'assets/png/money-profit.png',
                        titel: AppStrings.withdraw.tr,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IteamEstimatedBalnce(
                        onTap: () {
                          Get.bottomSheet(
                            const SendBottomSheet(),
                          );
                        },
                        image: 'assets/png/transfer.png',
                        titel: AppStrings.send.tr,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Expanded(
                      //   child: IteamEstimatedBalnce(
                      //     onTap: () {
                      //       Get.toNamed(Routes.deposit);
                      //     },
                      //     image: 'assets/png/money-income.png',
                      //     titel: AppStrings.deposit.tr,
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const UserCode()
        ],
      ),
    );
  }
}
