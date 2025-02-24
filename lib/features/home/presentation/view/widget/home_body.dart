import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/buy_body.dart';
import 'package:horsely_app/features/home/presentation/view/widget/sell_widgets/sell_body.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_icon.dart';
import 'package:horsely_app/features/home/presentation/view/widget/buy_widgets/iteam_buy.dart';
import 'package:horsely_app/features/home/presentation/view/widget/tap_bar.dart';

class HomeBody extends GetView<HomeControler> {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffb7dacc).withOpacity(0.1),
              borderRadius: BorderRadius.circular(17),
              border:
                  Border.all(color: const Color(0xffB7DACC).withOpacity(0.3)),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TapBar(),
            ),
          ),
          const SizedBox(height: 16),

          // AnimatedSwitcher to switch between different text fields

          Obx(() => controller.activeIndex.value == 0
              ? Row(
                  key: const ValueKey<int>(0), // مفتاح للتحويل بين الودجت
                  children: [
                    Expanded(
                      child: FilterIcon(
                          searchController: controller.buySearchController,
                          onSaved: (s) {
                            controller.getBuyData();
                          },
                          hintText: "  ${AppStrings.transactionamount.tr}",
                          textInputType: TextInputType.multiline),
                    ),
                  ],
                )
              : Row(
                  key: const ValueKey<int>(1), // مفتاح للتحويل بين الودجت
                  children: [
                    Expanded(
                      child: FilterIcon(
                          searchController: controller.sellSearchController,
                          onSaved: (s) {
                            controller.getSellData();
                          },
                          hintText: "  ${AppStrings.transactionamount.tr}",
                          textInputType: TextInputType.multiline),
                    ),
                  ],
                )),

          const SizedBox(height: 16),

          // AnimatedSwitcher for content based on active tab
          Obx(() {
            return Expanded(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: controller.activeIndex.value == 0
                      ? const BuyDataBody()
                      : const SellDataBody() // واجهة Sell
                  ),
            );
          }),
        ],
      ),
    );
  }
}
