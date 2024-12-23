import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/history/presentation/manager/controlers/tap_bar_history_Controler.dart';
import 'package:horsely_app/features/history/presentation/view/widget/header_history.dart';
import 'package:horsely_app/features/history/presentation/view/widget/my_tabel.dart';

class BodyHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TapBarHistoryControler controller = Get.put(TapBarHistoryControler());

    return Column(children: [
      const SizedBox(
        height: 10,
      ),
      HeaderHistory(controller: controller),
      const SizedBox(
        height: 8,
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 4,
                  spreadRadius: -3)
            ]),
        child: TabelHistory(
          data: [
            ["3:05 PM", "910.10", "+1.21%"],
            ["4:00 PM", "820.50", "+0.95%"],
            ["5:15 PM", "450.75", "-0.50%"],
          ],
        ),
      ),
    ]);
  }
}
