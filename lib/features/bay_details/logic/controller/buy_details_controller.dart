import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/bay_details/data/repo/create_offer_repo.dart';
import 'package:horsely_app/features/bay_details/presentation/view/widget/comfrim_buttom_sheet.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class TransactionsController extends GetxController {
  P2pItem? dataItem;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString selectedCurrencyId = "".obs;
  RxString cerid = "".obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController price = TextEditingController();

  void claculateRequiredAmount() {
    var itemPrice = (dataItem?.price ?? 0) / (dataItem?.avaliableAmount ?? 1);

    var priceEnter = double.tryParse(price.text) ?? 0.0;

    amountController.text =
        (itemPrice == 0 ? "0" : (priceEnter / itemPrice).toStringAsFixed(10))
            .toString();
  }

  CreateOfferRepo offersRepo = CreateOfferRepo();
  void creatOffer() async {
    startLoading();
    var res = await offersRepo.createOffer(
        price: price.text,
        orderId: dataItem?.id ?? 0,
        paymentmeathodId: int.tryParse(cerid.value) ?? 0,
        type: dataItem?.type == 'sell' ? 'buy' : 'sell');
    stopLoading();
    res.fold((l) {
      Get.bottomSheet(
          isScrollControlled: true,
          StatusSheet(
            success: false,
            message: l.message,
            onRetry: () async {
              creatOffer();
            },
          ));
      // ToastManager.showError(l.message);
    }, (r) {
      Get.bottomSheet(
          isScrollControlled: true,
          StatusSheet(
            success: true,
            onRetry: () async {
              creatOffer();
            },
          ));
    });
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      dataItem = Get.arguments;
    }
    super.onInit();
  }
}
