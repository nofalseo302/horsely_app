import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
  var currentPage = 0.obs; // متغير الحالة
  PageController pageController = PageController();

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page!.round();
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}