import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/offers_model.dart';
import 'package:horsely_app/features/account/features/offer/data/repo/offers_repo.dart';

class OffersController extends GetxController {
  //get buy sell
  Rxn<OffersModel?> offersData = Rxn<OffersModel?>();
  int sellDataCurrentPage = 1;
  OffersRepo offersRepo = OffersRepo.instance;
  ScrollController offersDataScrollController = ScrollController();
  void _sellScrollListener() async {
    if (offersData.value != null &&
        offersData.value!.data!.offers!.meta!.lastPage! >=
            sellDataCurrentPage &&
        offersDataScrollController.offset >=
            offersDataScrollController.position.maxScrollExtent &&
        !offersDataScrollController.position.outOfRange) {
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
        offersData.value = r;
      } else {
        sellDataCurrentPage++;
        offersData.value!.data!.offers?.data
            ?.addAll(r.data?.offers?.data ?? []);
      }
    });
    stopLoad();
  }

  RxBool isLoading = false.obs;
  startLoad() {
    if (offersData.value == null) {
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

  String title=AppStrings.totaloffer.tr;

  @override
  void onInit() {
    if (Get.arguments != null) {
      id = Get.arguments['id'];
      title = Get.arguments['title'];
      
      getOffers();
    }

    super.onInit();
  }
}
