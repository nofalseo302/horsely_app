import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/myorder/data/model/my_orders_model/my_orders_model.dart';
import 'package:horsely_app/features/account/features/myorder/data/repo/my_orders_repo.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';

class MyOrderController extends GetxController {
  var activeIndex = 0.obs; // لتمثيل التاب النشط

  void toggleTab(int index) {
    activeIndex.value = index; // تغيير التاب النشط
  }

  //get buy sell
  MyOrdersRepo ordersRepo = MyOrdersRepo.instance;
  Rxn<MyOrdersModel?> sellData = Rxn<MyOrdersModel?>();
  Rxn<MyOrdersModel?> buyData = Rxn<MyOrdersModel?>();
  int sellDataCurrentPage = 1;
  int buyDataCurrentPage = 1;

  ScrollController sellDataScrollController = ScrollController();
  ScrollController buyDataScrollController = ScrollController();
  void _sellScrollListener() async {
    if (sellData.value != null &&
        sellData.value!.data!.meta!.lastPage! >= sellDataCurrentPage &&
        sellDataScrollController.offset >=
            sellDataScrollController.position.maxScrollExtent &&
        !sellDataScrollController.position.outOfRange) {
      await getSellData(
        pageinate: true,
      );
    }
  }

  void _buyScrollListener() async {
    if (buyData.value != null &&
        buyData.value!.data!.meta!.lastPage! >= buyDataCurrentPage &&
        buyDataScrollController.offset >=
            buyDataScrollController.position.maxScrollExtent &&
        !buyDataScrollController.position.outOfRange) {
      await getBuyData(
        pageinate: true,
      );
    }
  }

  Future<void> getSellData({bool? pageinate = false}) async {
    startLoad();
    var result = await ordersRepo.getMyOrdersData(
        currentPage: sellDataCurrentPage, type: OfferType.sell);
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

  Future<void> getBuyData({bool? pageinate = false, withLoading = true}) async {
    if (withLoading) startLoad();

    var result = await ordersRepo.getMyOrdersData(
        currentPage: sellDataCurrentPage, type: OfferType.buy);
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
    if (withLoading) stopLoad();
  }

  RxBool isLoading = false.obs;
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

  @override
  void onInit() {
    Future.wait([
      getSellData(),
      getBuyData(withLoading: false),
    ]);
    super.onInit();
  }
}
