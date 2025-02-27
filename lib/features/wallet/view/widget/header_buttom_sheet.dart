import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

class HeaderButtomSheet extends StatelessWidget {
  const HeaderButtomSheet({super.key, required this.titel});
  final String titel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: AppStyles.semibold20(context).copyWith(fontSize: 28),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: const Color(0xffE8EFF5),
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.close)),
        )
      ],
    );
  }
}
