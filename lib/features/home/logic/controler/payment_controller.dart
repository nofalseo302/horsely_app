import 'package:get/get.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/repo/payment_repo.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';

class PaymentController extends GetxController {
  RxBool isfail = false.obs;
  RxBool isLoading = false.obs;
  PaymentRepo paymentRepo = PaymentRepo();
  AllPaymentMethod? allPaymentMethod = AllPaymentMethod();
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
      allPaymentMethod = r;

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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAllCurrency();
    await getAllPayment();
    await getCryptoCurrency();
  }
}
