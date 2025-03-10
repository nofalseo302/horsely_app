import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/function/app_launge.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/custom_skeleton.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/user_home_data.dart';
import 'package:horsely_app/features/home/data/repo/p2p_home_repo.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

import '../../../../core/services/translation/app_string.dart';

class HomeControler extends GetxController {
  CryptoCurrencyModel? cryptoCurrencyModel;
  AllCurrencyModel? allCurrencyModel;
  AllPaymentMethod? allPaymentMethod = AllPaymentMethod();

  RxBool isLoading = RxBool(false);
  RxBool isLoadingpay = false.obs;
  RxBool isfail = false.obs;
  final List<String> appBarTitles = [
    "Make P2P",
    AppStrings.wallet.tr,
    "",
    AppStrings.profit.tr,
    AppStrings.myprofile.tr
  ];
  var activeIndex = 0.obs; // لتمثيل التاب النشط

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
      await getSellData(
          pageinate: true,
          requestModel: HomeDataRequest(
            offerType: OfferType.sell,
          ));
    }
  }

  Future<void> getSellData(
      {bool? pageinate = false, required HomeDataRequest requestModel}) async {
    sellState.value = CustomState.loading;
    requestModel.offerType = OfferType.sell;
    var result = await p2pHomeRepo.getHomeData(
        currentPage: sellDataCurrentPage, request: requestModel);
    result.fold((l) {
      ToastManager.showError(l);
      sellState.value = CustomState.failure;
    }, (r) {
      if (r.data?.data?.isEmpty ?? false) {
        sellState.value = CustomState.empty;
      } else {
        sellState.value = CustomState.success;
      }
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
      await getBuyData(
          pageinate: true,
          requestModel: HomeDataRequest(offerType: OfferType.buy));
    }
  }

  Rxn<CustomState> state = Rxn<CustomState>(CustomState.loading);
  Rxn<CustomState> sellState = Rxn<CustomState>(CustomState.loading);

  Future<void> getBuyData(
      {bool? pageinate = false, required HomeDataRequest requestModel}) async {
    state.value = CustomState.loading;
    var result = await p2pHomeRepo.getHomeData(
        currentPage: sellDataCurrentPage, request: requestModel);
    result.fold((l) {
      state.value = CustomState.failure;
      ToastManager.showError(l);
    }, (r) {
      if (r.data?.data?.isEmpty ?? false) {
        state.value = CustomState.empty;
      } else {
        state.value = CustomState.success;
      }
      if (!pageinate!) {
        buyData.value = r;
      } else {
        buyDataCurrentPage++;
        buyData.value!.data!.data?.addAll(r.data?.data ?? []);
      }
    });
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
  var minValuePricesRating = 0.0.obs;
  var maxValuepricesRating = 100000.0.obs;

  void updateValues(double newMin, double newMax) {
    minValuePricesRating.value = newMin;
    maxValuepricesRating.value = newMax;
  }

  //---------------------------------------------------Transaction Limits---------------------
  var minValuetranactionlimit = 0.0.obs;
  var maxValuetranactionlimit = 100.0.obs;

  void updateValuestranactionlimit(double newMin, double newMax) {
    minValuetranactionlimit.value = newMin;
    maxValuetranactionlimit.value = newMax;
  }

  //=======endsilder=====================

  Future<void> getAllPaymentData() async {
    final paymentController = Get.find<PaymentController>();
    isLoadingpay.value = true;
    try {
      await paymentController.getAllCurrency();
      await paymentController.getCryptoCurrency();
      await paymentController.getAllPayment();
      cryptoCurrencyModel = paymentController.currencyModel.value;
      allCurrencyModel = paymentController.allCurrency.value;
      allPaymentMethod = paymentController.allpaymodel.value;
      isLoadingpay.value = false;
    } on Exception {
      isfail.value = true;
    }
    update();
  }

  @override
  void onInit() async {
    isLoading.value = true;
    isLoadingpay.value = true;
    await getBuyData(requestModel: HomeDataRequest(offerType: OfferType.buy));
    buyDataScrollController.addListener(_buyScrollListener);
    await getSellData(requestModel: HomeDataRequest(offerType: OfferType.buy));
    sellDataScrollController.addListener(_sellScrollListener);

    await getAllPaymentData();
    print(cryptoCurrencyModel?.message ?? "dadadada");
    super.onInit();
  }

  //chips section------------
  List<int> selectedCoinTypes = [];
  List<int> selectedAllCurrency = [];
  List<int> selectedAllPayment = [];

  ////------rest---------------------

  void resetFilter() {
    selectedCoinTypes = [];
    selectedAllCurrency = [];
    selectedAllPayment = [];
    minValuePricesRating.value = 0;
    maxValuepricesRating.value = 100000;
    minValuetranactionlimit.value = 0;
    maxValuetranactionlimit.value = 100;
    isLoadingpay.value = true;
    isLoadingpay.value = false;
  }
}
