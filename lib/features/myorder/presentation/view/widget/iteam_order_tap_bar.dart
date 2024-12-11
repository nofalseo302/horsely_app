import 'package:flutter/material.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class IteamOrderTapBar extends StatelessWidget {
  const IteamOrderTapBar({
    super.key,
    required this.active,
    required this.title,
  });
  final bool active;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: active ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(17)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13.0),
        child: Center(
            child: Text(
          title,
          style: AppStyles.semibold16(context).copyWith(color: Colors.black),
        )),
      ),
    );
  }
}
