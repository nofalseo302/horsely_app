import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/features/wallet/presentation/view/widget/header_section.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/header_wallest.dart';
import 'package:horsely_app/features/wallet/presentation/view/widget/iteam_last_tranaction.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(height: 30),
          const HeaderWallet(),
          const SizedBox(height: 40),
          HeaderSection(titel: AppStrings.lastTranaction.tr),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return IteamLastTranaction(isincome: index % 2 == 0);
              },
            ),
          )
        ],
      ),
    );
  }
}
