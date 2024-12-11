import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';

AppBar buildAppBar({required String titel, required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      titel,
      style: AppStyles.semibold18(context),
    ),
    leading: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffE9EFF5),
            borderRadius: BorderRadius.circular(11),
          ),
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              getCurrentLanguage() == "ar"
                  ? Icons.keyboard_arrow_right
                  : Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
          )),
    ),
  );
}
