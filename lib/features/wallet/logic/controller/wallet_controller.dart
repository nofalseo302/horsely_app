import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/wallet/data/model/crypto_currency_model/crypto_currency_model.dart';
import 'package:horsely_app/features/wallet/data/model/get_all_wallet_model/get_all_wallet_model.dart';
import 'package:horsely_app/features/wallet/data/repo/currency_repo.dart';
import 'package:horsely_app/features/wallet/data/repo/wallet_repo.dart';

class WalletController extends GetxController {
  final GetAllRepoRepo wallet = GetAllRepoRepo();
  GetAllWalletModel getAllWalletModel = GetAllWalletModel();
  RxInt? walletid = RxInt(0);

  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  getData({int page = 1}) async {
    if (page == 1) {
      isLoading.value = true;
    } else {
      startLoading();
    }
    var res = await wallet.getData(page: page);

    res.fold(
      (l) {
        isError.value = true;
        ToastManager.showError(l.message);
      },
      (r) async {
        isError.value = false;
        if (page == 1) {
          isLoading.value = false;
          getAllWalletModel = r;
        } else {
          getAllWalletModel.data!.data!.addAll(r.data!.data!);
          getAllWalletModel.data!.meta = r.data!.meta;
          isLoading.value = true;
          isLoading.value = false;
          update();
          stopLoading();
        }
      },
    );

    isLoading.value = false;
  }

  createWallet() async {
    startLoading();
    var res = await wallet.createWallet(id: walletid?.value ?? 0);
    stopLoading();
    res.fold(
      (l) {
        ToastManager.showError(l.message);
      },
      (r) async {
        getData();
      },
    );
  }

  _scrollListener() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        getAllWalletModel.data!.meta!.currentPage! <
            getAllWalletModel.data!.meta!.lastPage!) {
      getAllWalletModel.data!.meta!.currentPage =
          getAllWalletModel.data!.meta!.currentPage! + 1;
      update();
      await getData(page: getAllWalletModel.data!.meta!.currentPage!);
    }
  }

  @override
  Future<void> onInit() async {
    await getData();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  ///  -----------------get current crypto currency ----
  CurrencyRepo currencyRepo = CurrencyRepo();
  CryptoCurrencyModel cryptoCurrencyModel = CryptoCurrencyModel();
  var selindex = (-1).obs; // Observable variable
  RxBool isLoadingcurrency = false.obs;
  RxBool isErrorcurrency = false.obs;

  void choosewallet(int index, int crypto) {
    selindex.value =
        index; // Assigning the passed index to the observable variable
    walletid?.value = crypto;
  }

  void getCryptoCurrency() async {
    isLoadingcurrency.value = true;
    var res = await currencyRepo.getCryptoCurrency();
    isLoadingcurrency.value = false;
    res.fold((l) {
      isErrorcurrency.value = true;
      ToastManager.showError(l.message);
    }, (r) {
      // ToastManager.showSuccess(r.message ?? "", true);
      cryptoCurrencyModel = r;
    });
  }
}
