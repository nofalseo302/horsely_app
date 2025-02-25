import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';

import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/repo/payment_repo.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';

class AddPaymentMethodController extends GetxController {
  List<TextEditingController> paymentMethodsAnwers = [];
  Rxn<AllPaymentMethod>? paymentMethodsModel = Rxn<AllPaymentMethod>();
  PaymentRepo paymentMethodRepo = PaymentRepo();

  savePayment() async {
    for (var element in paymentMethodsAnwers) {
      if (element.text.isEmpty) {
        ToastManager.showError(AppStrings.requiredField.tr);
        return;
      }
    }
    var l = [];
    var paymentMethodId = Get.arguments;
    var ids = paymentMethodsModel!.value!.data!
        .firstWhere(
            (element) => element.id.toString() == Get.arguments.toString())
        .fields!
        .map((v) => v.id)
        .toList();
    for (int i = 0; i < paymentMethodsAnwers.length; i++) {
      l.add(
        {"id": ids[i], "value": paymentMethodsAnwers[i].text},
      );
    }
    startLoading();

    var res = await paymentMethodRepo.sendPaymentMethods(
      formData: d.FormData.fromMap(
        {
          "payment_method_id": paymentMethodId,
          "payment_method_fields": l,
        },
      ),
    );
    Get.back();
    await res.fold(
      (l) async {
        // await stopLoading();
        // await stopLoading();

        ToastManager.showError(l.message);
      },
      (r) {
        ToastManager.showSuccess(r, true);
        Get.find<PaymentController>().getAllPayment();
      },
    );
  }

  @override
  void onInit() {
    for (var element in Get.find<PaymentController>()
        .allpaymodel
        .value
        .data!
        .firstWhere(
            (element) => element.id.toString() == Get.arguments.toString())
        .fields!) {
      paymentMethodsAnwers.add(
        TextEditingController(
          text: element.value,
        ),
      );
    }

    paymentMethodsModel = Rxn(Get.find<PaymentController>().allpaymodel.value);

    super.onInit();
  }
}
