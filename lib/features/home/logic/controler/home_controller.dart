import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/home/data/repo/payment_repo.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/user_home_data.dart';
import 'package:horsely_app/features/home/data/repo/p2p_home_repo.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

import '../../../../core/services/translation/app_string.dart';

class HomeControler extends GetxController {
  CryptoCurrencyModel? cryptoCurrencyModel;

  RxBool isLoading = RxBool(false);
  final List<String> appBarTitles = [
    "Make P2P",
    AppStrings.wallet.tr,
    "",
    AppStrings.profit.tr,
    AppStrings.myprofile.tr
  ];
  var activeIndex = 1.obs; // لتمثيل التاب النشط

  void toggleTab(int index) {
    activeIndex.value = index; // تغيير التاب النشط
  }

  TextEditingController sellSearchController = TextEditingController();
  TextEditingController buySearchController = TextEditingController();
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
  void _sellScrollListener() async {
    if (sellData.value != null &&
        sellData.value!.data!.meta!.lastPage! >= sellDataCurrentPage &&
        sellDataScrollController.offset >=
            sellDataScrollController.position.maxScrollExtent &&
        !sellDataScrollController.position.outOfRange) {
      await getSellData(pageinate: true);
    }
  }

  Future<void> getSellData({bool? pageinate = false}) async {
    startLoad();

    var result = await p2pHomeRepo.getSellData(
        currentPage: sellDataCurrentPage, search: sellSearchController.text);
    result.fold((l) {
      ToastManager.showError(l);
    }, (r) {
      if (!pageinate!) {
        sellData.value = r;
      } else {
        sellDataCurrentPage++;
        sellData.value!.data!.data?.addAll(r.data?.data ?? []);
      }
    });
    stopLoad();
  }

  Rxn<UserHomeData?> buyData = Rxn<UserHomeData?>();
  int buyDataCurrentPage = 1;
  ScrollController buyDataScrollController = ScrollController();
  void _buyScrollListener() async {
    if (buyData.value != null &&
        buyData.value!.data!.meta!.lastPage! >= buyDataCurrentPage &&
        buyDataScrollController.offset >=
            buyDataScrollController.position.maxScrollExtent &&
        !buyDataScrollController.position.outOfRange) {
      await getBuyData(pageinate: true);
    }
  }

  Future<void> getBuyData({bool? pageinate = false}) async {
    startLoad();

    var result = await p2pHomeRepo.getBuyData(
        currentPage: sellDataCurrentPage, search: buySearchController.text);
    result.fold((l) {
      ToastManager.showError(l);
    }, (r) {
      if (!pageinate!) {
        buyData.value = r;
      } else {
        buyDataCurrentPage++;
        buyData.value!.data!.data?.addAll(r.data?.data ?? []);
      }
    });
    stopLoad();
  }

  startLoad() {
    if (buyData.value == null || sellData.value == null) {
      isLoading.value = true;
    } else {
      startLoading();
    }
  }

  stopLoad() {
    if (isLoading.value) {
      isLoading.value = false;
    } else {
      stopLoading();
      isLoading.value = true;
      isLoading.value = false;
    }
  }

  /////***************silder */
  var minValuePricesRating = 20.0.obs;
  var maxValuepricesRating = 80.0.obs;

  void updateValues(double newMin, double newMax) {
    minValuePricesRating.value = newMin;
    maxValuepricesRating.value = newMax;
  }

  //---------------------------------------------------Transaction Limits---------------------
  var minValuetranactionlimit = 20.0.obs;
  var maxValuetranactionlimit = 80.0.obs;

  void updateValuestranactionlimit(double newMin, double newMax) {
    minValuetranactionlimit.value = newMin;
    maxValuetranactionlimit.value = newMax;
  }

  //=======endsilder=====================
  @override
  void onInit() async {
    await getBuyData();
    buyDataScrollController.addListener(_buyScrollListener);
    await getSellData();
    sellDataScrollController.addListener(_sellScrollListener);

    ever(Get.find<PaymentController>().currencyModel, (currency) {
      cryptoCurrencyModel = currency;
      update();
    });
    print(cryptoCurrencyModel?.message ?? "dadadada");
    super.onInit();
  }
}
