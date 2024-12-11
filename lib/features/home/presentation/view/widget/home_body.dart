import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/home/presentation/manager/controler/tab_bart_controler.dart';
import 'package:horsely_app/features/home/presentation/view/widget/filter_icon.dart';
import 'package:horsely_app/features/home/presentation/view/widget/iteam_buy.dart';
import 'package:horsely_app/features/home/presentation/view/widget/tap_bar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TapBarController controller = Get.put(TapBarController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffB7DACC).withOpacity(0.1),
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
          Row(
            key: const ValueKey<int>(0), // مفتاح للتحويل بين الودجت
            children: [
              Expanded(
                child: FilterIcon(
                    hintText: "  ${AppStrings.transactionamount.tr}",
                    textInputType: TextInputType.multiline),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // AnimatedSwitcher for content based on active tab
          Obx(() {
            return Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: controller.activeIndex.value == 0
                    ? ListView.builder(
                        key: ValueKey<int>(controller
                            .activeIndex.value), // مفتاح لتفادي الأخطاء
                        itemCount: 10, // عدد العناصر
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: IteamBuy(
                            isbay: true,
                            nameButttom: AppStrings.buy.tr,
                            onTap: () {
                              Get.toNamed(Routes.buydetails);
                            },
                          ),
                        ), // واجهة Buy
                      )
                    : ListView.builder(
                        key: ValueKey<int>(controller
                            .activeIndex.value), // مفتاح لتفادي الأخطاء
                        itemCount: 10, // عدد العناصر
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: IteamBuy(
                            isbay: false,
                            nameButttom: AppStrings.sell.tr,
                            onTap: () {
                              Get.toNamed(Routes.selldetails);
                            },
                          ),
                        ), // واجهة Buy
                      ), // واجهة Sell
              ),
            );
          }),
        ],
      ),
    );
  }
}
