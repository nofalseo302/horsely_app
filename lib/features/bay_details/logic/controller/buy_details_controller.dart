import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/datum.dart';

class BuyDetailsController extends GetxController {
  P2pItem? dataItem;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString selectedCurrencyId = "".obs;
  RxString cerid = "".obs;
  TextEditingController amountController = TextEditingController();
  TextEditingController price = TextEditingController();

  void callData() {
    var priceItem = (dataItem?.price ?? 0) / (dataItem?.avaliableAmount ?? 1);
    print(priceItem);
    var priceEnter = double.tryParse(price.text) ?? 0.0;

    amountController.text = (priceEnter * priceItem).toString();
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      dataItem = Get.arguments;
    }
    super.onInit();
  }
}
