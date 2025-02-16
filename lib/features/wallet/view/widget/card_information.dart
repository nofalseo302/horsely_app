import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class CardInformation extends StatelessWidget {
  const CardInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffE9EFF5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/png/company.png"),
            radius: 25,
          ),
          title: Text(
            "Ahmed Hassan",
            style: AppStyles.semibold16(context),
          ),
          subtitle: Text(
            "AhmedHussen19@gmail.com",
            style: AppStyles.semibold14(context)
                .copyWith(color: const Color(0xff545454)),
          ),
        ),
      ),
    );
  }
}
