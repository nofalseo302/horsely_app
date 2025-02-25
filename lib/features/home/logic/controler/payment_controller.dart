import 'package:get/get.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/repo/payment_repo.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';

class PaymentController extends GetxController {
  setDefault({
    required int paymentMethodId,
  }) async {
    var response = await paymentRepo.setDefault(
      paymentMethodId: paymentMethodId,
    );
    response.fold(
      (l) {
        ToastManager.showError(l.message);
      },
      (r) {
        ToastManager.showSuccess(r, true);
        for (var element in allpaymodel.value.data!) {
          if (element.id == paymentMethodId) {
            element.isDefault = true;
          } else {
            element.isDefault = false;
          }
        }
        allpaymodel.refresh();
      },
    );
  }

  RxInt selectedPaymentMethod = 1.obs;

  void expandTile(int value) {
    selectedPaymentMethod.value = value;
  }

  @override
  void onInit() {
    selectedPaymentMethod.value = 6;
    super.onInit();
  }

  RxBool isfail = false.obs;
  RxBool isLoading = false.obs;
  PaymentRepo paymentRepo = PaymentRepo();
  Rx<AllPaymentMethod> allpaymodel = (AllPaymentMethod()).obs;
  Rx<CryptoCurrencyModel> currencyModel = (CryptoCurrencyModel()).obs;

  Rx<AllCurrencyModel> allCurrency = (AllCurrencyModel()).obs;
  Future<void> getAllCurrency() async {
    isLoading.value = true;
    var res = await paymentRepo.getAllCurrency();
    isLoading.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      isfail.value = false;
      allCurrency.value = r;
    });
  }

  Future<void> getAllPayment() async {
    isLoading.value = true;
    var res = await paymentRepo.getAllPayment();
    isLoading.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      allpaymodel.value = r;

      isfail.value = false;
    });
  }

  Future<void> getCryptoCurrency() async {
    isLoading.value = true;
    var res = await paymentRepo.getCryptoCurrency();
    isLoading.value = false;
    res.fold((l) {
      isfail.value = true;
    }, (r) {
      currencyModel.value = r;
      isfail.value = false;
    });
  }
}
