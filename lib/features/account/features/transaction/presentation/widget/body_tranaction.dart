import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/profit/presentation/view/widget/iteam_transaction.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/transaction_details_screen.dart';

class BodyTransaction extends StatelessWidget {
  const BodyTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
          itemCount: 5,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          itemBuilder: (context, index) => IteamTransaction(
                onTap: () {
                  Get.to(const TransactionDetailsScreen());
                },
              )),
    );
  }
}
