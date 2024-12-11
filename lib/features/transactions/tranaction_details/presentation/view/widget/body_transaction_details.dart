import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/manager/controler/tap_bar_tranaction_details_contoler.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/widget/graph_section.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/widget/header_section.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/widget/header_transaction_details.dart';

class TransactionDetails extends StatelessWidget {
  const TransactionDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final TapBarTranactionDetailsContoler controller =
        Get.put(TapBarTranactionDetailsContoler());

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderTransactionDetails(),
              const SizedBox(
                height: 8,
              ),
              GraphInformation(controller: controller),
              const SizedBox(
                height: 10,
              ),
              const HistorySection()
            ],
          )
        ],
      ),
    );
  }
}
