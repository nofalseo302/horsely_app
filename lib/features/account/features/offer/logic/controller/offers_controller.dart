import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/myorder/data/model/my_orders_model/my_orders_model.dart';
import 'package:horsely_app/features/account/features/offer/data/repo/offers_repo.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';

class OffersController extends GetxController {
  //get buy sell
  Rxn<MyOrdersModel?> sellData = Rxn<MyOrdersModel?>();
  int sellDataCurrentPage = 1;
  OffersRepo offersRepo = OffersRepo.instance;
  ScrollController sellDataScrollController = ScrollController();
  void _sellScrollListener() async {
    if (sellData.value != null &&
        sellData.value!.data!.meta!.lastPage! >= sellDataCurrentPage &&
        sellDataScrollController.offset >=
            sellDataScrollController.position.maxScrollExtent &&
        !sellDataScrollController.position.outOfRange) {
      await getOffers(
        pageinate: true,
      );
    }
  }

  int? id;

  Future<void> getOffers({bool? pageinate = false}) async {
    startLoad();
    var result = await offersRepo.getOffersData(
      currentPage: sellDataCurrentPage,
      id: id!,
    );
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

  RxBool isLoading = false.obs;
  startLoad() {
    if (sellData.value == null) {
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
    if (Get.arguments != null) {
      id = Get.arguments;
      getOffers();
    }

    super.onInit();
  }
}
