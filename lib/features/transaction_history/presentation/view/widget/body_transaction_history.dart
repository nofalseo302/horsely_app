import 'package:flutter/material.dart';

import 'package:horsely_app/features/transaction_history/presentation/view/widget/iteam_transaction.dart';

class BodyTransactionHistoryScreen extends StatelessWidget {
  const BodyTransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.25),
                    blurRadius: 3,
                    spreadRadius: -1,
                  ),
                ]),
            child: ListView.builder(
                itemBuilder: (context, index) =>  const IteamTranslation()),
          ),
        ),
      ],
    );
  }
}
