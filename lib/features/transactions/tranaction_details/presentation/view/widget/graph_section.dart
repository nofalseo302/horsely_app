import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_tap_bar_profit.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/manager/controler/tap_bar_tranaction_details_contoler.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/widget/live_chart.dart';

class GraphInformation extends StatelessWidget {
  const GraphInformation({
    super.key,
    required this.controller,
  });

  final TapBarTranactionDetailsContoler controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 250, child: LiveChart()),
            SizedBox(
              height: 2,
            ),
            FittedBox(
              child: Obx(() {
                return Row(
                  children: List.generate(
                    controller.iteamtapbar.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4.0, vertical: 16),
                      child: ItamTapBarProfit(
                        nameiteam: controller.iteamtapbar[index],
                        isactive: controller.activeIndex.value == index,
                        onTap: () => controller.setActiveIndex(index),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
