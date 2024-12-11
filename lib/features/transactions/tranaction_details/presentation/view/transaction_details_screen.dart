import 'package:flutter/material.dart';

import 'package:horsely_app/core/widget/build_app_bar.dart';

import 'widget/body_transaction_details.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(titel: "BTC", context: context),
      body: const TransactionDetails(),
    );
  }
}



