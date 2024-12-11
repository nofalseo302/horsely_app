import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/history/presentation/manager/controlers/tap_bar_history_Controler.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_tap_bar_profit.dart';

class HeaderHistory extends StatelessWidget {
  const HeaderHistory({
    super.key,
    required this.controller,
  });

  final TapBarHistoryControler controller;

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
      child: FittedBox(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
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
            ),
          );
        }),
      ),
    );
  }
}
