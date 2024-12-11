import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class ListTileIteamHome extends StatelessWidget {
  const ListTileIteamHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween, // يوزع العناصر بين بداية ونهاية الـ Row
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // القسم الأيسر يحتوي على الصورة والعنوان والتفاصيل
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/png/company.png"),
              ),
              const SizedBox(width: 10), // مسافة بين الصورة والنص
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "waseela_21912",
                    style: AppStyles.semibold16(context),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        "219 ${AppStrings.order.tr}   |",
                        style: AppStyles.semibold12(context)
                            .copyWith(color: const Color(0xff8A8A8A)),
                      ),
                      const SizedBox(width: 9),
                      Text(
                        "198 ${AppStrings.complete.tr}",
                        style: AppStyles.semibold12(context)
                            .copyWith(color: const Color(0xff8A8A8A)),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // القسم الأيمن يحتوي على الوقت (trailing)
          Text(
            "198 min",
            style: AppStyles.semibold12(context)
                .copyWith(color: const Color(0xff8A8A8A)),
          ),
        ],
      ),
    );
  }
}
