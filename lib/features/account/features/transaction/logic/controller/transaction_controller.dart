import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/transaction/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/account/features/transaction/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/account/features/transaction/data/model/creatp2p_model/payment_method.dart';
import 'package:horsely_app/features/account/features/transaction/data/repo/payment_repo.dart';
import 'package:horsely_app/features/account/features/transaction/data/repo/transaction_repo.dart';
import 'package:horsely_app/features/wallet/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/wallet/data/repo/currency_repo.dart';

class TransactionController extends GetxController {
  var activeIndex = 0.obs;
  RxString coinType = "".obs;
  RxList<PaymentMethod> selectedPaymentMethods = <PaymentMethod>[].obs;
  RxString coinTypeId = "".obs;
  RxString currency = "".obs;
  RxString currencyId = "".obs;
  RxString cerid = "".obs;
  GlobalKey<FormState> globalKey = GlobalKey();
  RxString paymethodId = "".obs;
  RxString selectedCurrencyId = "".obs;
  PaymentRepo paymentRepo = PaymentRepo();
  CurrencyRepo currencyRepo = CurrencyRepo();
  TransactionRepo trans = TransactionRepo();
  void toggleTab(int index) => activeIndex.value = index;
  Rx<AllCurrencyModel> allCurrency = (AllCurrencyModel()).obs;

  RxBool isolating = true.obs;
  RxBool isfail = false.obs;
  TextEditingController decoration = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController limit = TextEditingController();
  TextEditingController uper = TextEditingController();
  AllPaymentMethod? allPaymentMethod = AllPaymentMethod();
  Rx<CryptoCurrencyModel> currencyModel = (CryptoCurrencyModel()).obs;
  Future<void> getAllCurrency() async {
    isolating.value = true;
    var res = await paymentRepo.getAllCurrency();
    isolating.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      isfail.value = false;
      allCurrency.value = r;
    });
  }

  Future<void> getAllPayment() async {
    isolating.value = true;
    var res = await paymentRepo.getAllPayment();
    isolating.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      allPaymentMethod = r;

      isfail.value = false;
    });
  }

  Future<void> getCryptoCurrency() async {
    isolating.value = true;
    var res = await paymentRepo.getCryptoCurrency();
    isolating.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      currencyModel.value = r;
      isfail.value = false;
    });
  }

  void CreatbayAndSell() async {
    print(cerid.value);
    startLoading();
    var res = await trans.createPayAndSell(
        amount: amount.text,
        price: price.text,
        paymentMethod:
            selectedPaymentMethods.map(((e) => e.id.toString())).toList(),
        currencyId: currencyId.value,
        minLimit: limit.text,
        maxLimit: uper.text,
        cyreptoCurrencyId: cerid.value,
        description: decoration.text,
        type: "sell");
    stopLoading();
    res.fold((l) {
      ToastManager.showSuccess(l.message ?? "", true);
    }, (r) {
      ToastManager.showSuccess(r.message ?? "", true);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    await getAllCurrency();
    await getAllPayment();
    await getCryptoCurrency();
    update();
  }
}
