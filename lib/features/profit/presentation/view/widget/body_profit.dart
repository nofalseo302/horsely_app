import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/header_profit.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_transaction.dart';

class BodyProfit extends StatelessWidget {
  const BodyProfit({super.key});

  @override
  Widget build(BuildContext context) {
    final TapBarProfitControler controller = Get.put(TapBarProfitControler());
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Headerprofit(controller: controller),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Row(
              children: [
                Text(
                  AppStrings.transaction.tr,
                  style: AppStyles.semibold20(context),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.transation);
                  },
                  child: Text(
                    AppStrings.seeall.tr,
                    style: AppStyles.semibold14(context)
                        .copyWith(color: AppColors.primaryColor),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: List.generate(
                2,
                (index) => Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: IteamTransaction(
                    onTap: () {
                      Get.toNamed(Routes.transactiondetails);
                    },
                  ),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
