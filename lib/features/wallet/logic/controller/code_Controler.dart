import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/wallet/data/model/get_blance_model/get_blance_model.dart';
import 'package:horsely_app/features/wallet/data/repo/wallet_repo.dart';

class BlancController extends GetxController {
  bool isObscured = true; // حالة النص إذا كان مشفّرًا أو مرئيًا
  String data = "This is  "; // النص الذي تريد عرضه
  GetAllRepoRepo walletRepo = GetAllRepoRepo();
  GetBlancModel blancModel = GetBlancModel();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  TextEditingController amount = TextEditingController();
  void toggleVisibility() {
    isObscured = !isObscured;
    update(); // لتحديث الواجهة
  }

  void copyText() {
    Clipboard.setData(ClipboardData(text: data));
  }

  void getBalance() async {
    isLoading.value = true;
    var res = await walletRepo.getBalance(walletid: Get.arguments.toString());
    isLoading.value = false;
    res.fold((l) {
      print(l.message);
      isError.value = true;
      ToastManager.showError(l.message);
    }, (r) {
      blancModel = r;
      ToastManager.showSuccess(r.message ?? "", true);
      print(r);
    });
  }

  @override
  void onInit() {
    print(Get.arguments);
    super.onInit();
    getBalance();
  }

  Future<void> transfer() async {
    startLoading();
    var res = await walletRepo.transfer(
        amount: amount.text,
        toAdderss: blancModel.data?[0].address ?? "",
        id: blancModel.data?[0].id ?? 0);
    stopLoading();
    res.fold((l) {
      amount.text = "";
      Get.back();
      ToastManager.showError(l.message);
    }, (r) {
      amount.text = "";
      Get.back();
      ToastManager.showSuccess(r.message ?? "", true);
    });
  }
}
