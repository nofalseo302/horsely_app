import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/features/wallet/data/model/get_all_wallet_model/get_all_wallet_model.dart';
import 'package:horsely_app/features/wallet/data/repo/get_all_repo_repo.dart';

class WalletController extends GetxController {
  final GetAllRepoRepo wallet = GetAllRepoRepo();
  GetAllWalletModel getAllWalletModel = GetAllWalletModel();

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
      },
      (r) async {
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
}
