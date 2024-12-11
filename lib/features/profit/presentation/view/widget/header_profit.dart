import 'package:flutter/material.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/custom_tap_bar_profit.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/income_chart.dart';
import 'package:get/get.dart';

class Headerprofit extends StatelessWidget {
  const Headerprofit({
    super.key,
    required this.controller,
  });

  final TapBarProfitControler controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 4,
            spreadRadius: -3)
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTapBarProfit(controller: controller),
            const SizedBox(height: 16),
            Text(
              AppStrings.totalincome.tr,
              style: AppStyles.semibold18(context)
                  .copyWith(color: const Color(0xff8A8A8A)),
            ),
            AnimatedSwitcher(
              duration:
                  const Duration(milliseconds: 300), // مدة الرسوم المتحركة
              transitionBuilder: (Widget child, Animation<double> animation) {
                const begin = Offset(0.0, 0.5); // البداية من الأسفل
                const end = Offset.zero; // النهاية في موضعها الطبيعي
                const curve = Curves.easeInOut; // منحنى الرسوم المتحركة

                var tween = Tween(begin: begin, end: end)
                    .chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
              child: Text(
                "\$7892.80", // يمكن تغييره حسب الفهرس النشط أو أي قيمة أخرى
                key: ValueKey<int>(
                    controller.activeIndex.value), // المفتاح الفريد
                style:
                    AppStyles.semibold32(context).copyWith(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: const LineChartSample()),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
