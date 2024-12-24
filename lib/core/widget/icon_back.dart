import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.3),
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 9,
                spreadRadius: 0)
          ]),
      child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: getCurrentLanguage() == "ar"
                ? const Icon(Icons.keyboard_arrow_right, color: Colors.white)
                : const Icon(Icons.keyboard_arrow_left, color: Colors.white),
          )),
    );
  }
}
