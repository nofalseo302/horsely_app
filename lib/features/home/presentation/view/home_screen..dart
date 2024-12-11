import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/account/presentation/view/account_screen.dart';
import 'package:horsely_app/features/home/presentation/manager/controler/home_controler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horsely_app/features/home/presentation/view/widget/home_body.dart';
import 'package:horsely_app/features/profit/presentation/view/profit_screen.dart';
import 'package:horsely_app/features/wallet/presentation/view/wallet_screen.dart';

class HomeScreen extends GetView<HomeControler> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.notifactionscreen);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xffF8FCFA),
                    borderRadius: BorderRadius.circular(11),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(.2), blurRadius: 1),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(AppImages.notifactionHome),
                ),
              ),
            ),
          )
        ],
        elevation: 0,
        centerTitle: true,
        title: GetBuilder<HomeControler>(
          builder: (controller) => Text(
            controller.appBarTitles[controller.selindex],
            style: AppStyles.semibold18(context).copyWith(color: Colors.black),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: Image.asset(AppImages.homeLeading),
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: GetBuilder<HomeControler>(
        builder: (controller) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: controller.selindex,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: controller.onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.homeicon,
                color: controller.selindex == 0
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              label: AppStrings.home.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.wallet,
                color: controller.selindex == 1
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              label: AppStrings.wallet.tr,
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/png/chart-histogram.png"),
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.profits,
                color: controller.selindex == 3
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              label: AppStrings.profits.tr,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.accont,
                color: controller.selindex == 4
                    ? AppColors.primaryColor
                    : Colors.grey,
              ),
              label: AppStrings.myprofile.tr,
            ),
          ],
        ),
      ),
      body: GetBuilder<HomeControler>(
        builder: (controller) => IndexedStack(
          index: controller.selindex,
          children: [
            const HomeBody(),
            const WalletScreen(),
            Container(),
            const ProfitSceen(),
            const AccountScreen(),
          ],
        ),
      ),
    );
  }
}
