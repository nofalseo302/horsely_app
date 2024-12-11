import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';

import 'package:horsely_app/features/wallet/presentation/view/widget/iteam_estimlation.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/transferm_butttom_sheet.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/user_code.dart';

class HeaderWallet extends StatelessWidget {
  const HeaderWallet({
    super.key,
  });

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
                    fit: BoxFit.cover)),
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
                    "\$217,479.31",
                    style: AppStyles.semibold32(context),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: IteamEstimatedBalnce(
                        onTap: () {
                          Get.toNamed(Routes.withdraw);
                        },
                        image: 'assets/png/money-profit.png',
                        titel: AppStrings.withdraw.tr,
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: IteamEstimatedBalnce(
                          onTap: () {
                            Get.bottomSheet(
                              const TransferbuttomSheet(),
                            );
                          },
                          image: 'assets/png/transfer.png',
                          titel: AppStrings.send.tr,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: IteamEstimatedBalnce(
                          onTap: () {
                            Get.toNamed(Routes.deposit);
                          },
                          image: 'assets/png/money-income.png',
                          titel: AppStrings.deposit.tr,
                        ),
                      ),
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
