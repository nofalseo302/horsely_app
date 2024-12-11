import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_colors.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamLastTranaction extends StatelessWidget {
  const IteamLastTranaction({
    super.key,
    required this.isincome,
  });
  final bool isincome;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        radius: 25,
        backgroundColor:
            isincome ? const Color(0xffE8F3EF) : const Color(0xffD20000).withOpacity(.1),
        child: Center(
          child: Image.asset(
            "assets/png/money-income.png",
            color: isincome ? AppColors.primaryColor : const Color(0xffD20000),
          ),
        ),
      ),
      title: Text(
        "Today 2:30 PM",
        style: AppStyles.semibold12(context).copyWith(color: const Color(0xff545454)),
      ),
      subtitle: Text(
        "Depoit",
        style: AppStyles.semibold16(context),
      ),
      trailing: Text(
        "\$2.801,28",
        style: AppStyles.semibold14(context).copyWith(
            color: isincome ? AppColors.primaryColor : const Color(0xffD20000)),
      ),
    );
  }
}
