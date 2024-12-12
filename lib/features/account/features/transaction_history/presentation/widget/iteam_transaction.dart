import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
<<<<<<<< HEAD:lib/features/transactions/transaction_history/presentation/view/widget/iteam_transaction.dart
import 'package:horsely_app/features/transactions/transaction_history/presentation/view/widget/buttton_buy.dart';
========
import 'package:horsely_app/features/account/features/transaction_history/presentation/widget/buttton_buy.dart';
>>>>>>>> origin/Ali:lib/features/account/features/transaction_history/presentation/widget/iteam_transaction.dart

class IteamTranslation extends StatelessWidget {
  const IteamTranslation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: AssetImage(AppImages.pitcont),
        radius: 25,
      ),
      title: Text(
        "Bitcoin",
        style: AppStyles.semibold16(context),
      ),
      subtitle: Text(
        ".001892",
        style: AppStyles.semibold16(context),
      ),
      trailing: Column(
        children: [
          const ButtonBayAnd(),
          const SizedBox(
            height: 4,
          ),
          Text(
            "\$2.801,28",
            style: AppStyles.semibold14(context),
          )
        ],
      ),
    );
  }
}
