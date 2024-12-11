import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamPayWay extends StatelessWidget {
  const IteamPayWay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff00AC1C).withOpacity(.1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
        child: Text(
          "InstaPay",
          style:
              AppStyles.semibold12(context).copyWith(color: const Color(0xff00AC1C)),
        ),
      ),
    );
  }
}
