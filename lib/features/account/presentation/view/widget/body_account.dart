import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';
import 'package:horsely_app/features/account/presentation/manager/controller/account_controler.dart';
import 'package:horsely_app/features/account/presentation/view/widget/iteam_account.dart';
import 'package:horsely_app/routes/routes.dart';

class BodyAccount extends StatelessWidget {
  const BodyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        children: [
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.accountseting.tr,
              image: AppImages.seting,
              onPressed: () {
                Get.toNamed(Routes.seting);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.transaction.tr,
              image: AppImages.coin,
              onPressed: () {
                Get.toNamed(Routes.transation);
              },
            ),
          ),
          IteamAccount(
            trailing: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 15,
              child: Text(
                "3",
                style:
                    AppStyles.semibold12(context).copyWith(color: Colors.white),
              ),
            ),
            accountEntity: AccountEntity(
              titel: AppStrings.myorder.tr,
              image: AppImages.myOrder,
              onPressed: () {
                Get.toNamed(Routes.myorder);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.transactionhistory.tr,
              image: AppImages.profit,
              onPressed: () {
                Get.toNamed(Routes.transactionhoistry);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.notifactionseting.tr,
              image: AppImages.notifaction,
              onPressed: () {
                Get.toNamed(Routes.notifactionseting);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.verificationstatus.tr,
              image: AppImages.stauts,
              onPressed: () {
                Get.toNamed(Routes.verificationstatus);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: "${AppStrings.pincode.tr}",
              image: AppImages.appCircle,
              onPressed: () {
                Get.toNamed(Routes.pincode);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.support.tr,
              image: AppImages.pincode,
              onPressed: () {
                Get.toNamed(Routes.support);
              },
            ),
          ),
          IteamAccount(
            accountEntity: AccountEntity(
              titel: AppStrings.deleteaccount.tr,
              image: AppImages.deletaccount,
              onPressed: () {},
            ),
          ),
          IteamAccount(
            textColor: AppColors.redColor,
            accountEntity: AccountEntity(
              titel: AppStrings.logout.tr,
              image: AppImages.logout,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
