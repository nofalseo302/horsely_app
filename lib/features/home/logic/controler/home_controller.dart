import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/user_home_data.dart';
import 'package:horsely_app/features/home/data/repo/p2p_home_repo.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

import '../../../../core/services/translation/app_string.dart';

class HomeControler extends GetxController {
  RxBool isLoading = RxBool(false);
  // قائمة أسماء العناوين بناءً على الـ index
  final List<String> appBarTitles = [
    "Make P2P",
    AppStrings.wallet.tr,
    "",
    AppStrings.profit.tr,
    AppStrings.myprofile.tr
  ];

  TapBarProfitControler tapBarProfitController = TapBarProfitControler();
  int selindex = 0;
  void onItemTapped(int index) {
    selindex = index;
    update();
    if (selindex == 3) {
      tapBarProfitController.setActiveIndex(0);
      getCurrentLanguage == "en"
          ? tapBarProfitController.iteamtapbar =
              ["Daily", "Weekly", "Monthly", "Yearly"].obs
          : ["يومي", "اسبوعي", "شهري", "سنوي"].obs;
      ();
      update();
    }
  }

  void onPageChanged(int index) {
    selindex = index;

    update();
  }

  //get buy sell
  P2pHomeRepo p2pHomeRepo = P2pHomeRepo.instance;
  Rxn<UserHomeData?> sellData = Rxn<UserHomeData?>();
  int sellDataCurrentPage = 1;
  ScrollController sellDataScrollController = ScrollController();
  void _scrollListener() async {
    if (sellData.value != null &&
        sellData.value!.data!.meta!.lastPage! >= sellDataCurrentPage &&
        sellDataScrollController.offset >=
            sellDataScrollController.position.maxScrollExtent &&
        !sellDataScrollController.position.outOfRange) {
      await getSell(pageinate: true);
    }
  }

  Future<void> getSell({bool? pageinate = false}) async {
    isLoading.value = true;

    var result = await p2pHomeRepo.getSellData(
        currentPage: sellDataCurrentPage, search: '');
    result.fold((l) {
      ToastManager.showError(l);
    }, (r) {
      if (!pageinate!) {
        sellData.value = r;
      } else {
        sellDataCurrentPage++;
        sellData.value!.data!.data?.addAll(r.data?.data ?? []);
      }
      isLoading.value = false;
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    log(UserService.to.currentUser.value?.data?.completeDataStatus.toString() ??
        "");
  }
}
