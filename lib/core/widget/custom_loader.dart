import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: AppColors.primaryColor),
    );
  }
}

startLoading() async {
  Get.closeAllSnackbars();
  await Future.delayed(const Duration(milliseconds: 0), () {
    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      useSafeArea: true,
      builder: (context) => const CustomLoader(),
    );
  });
}

stopLoading() {
  Get.closeAllSnackbars();
  Get.back();
}
