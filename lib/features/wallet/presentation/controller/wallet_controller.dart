import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/wallet/data/repo/get_all_repo_repo.dart';

class WalletController extends GetxController {
  final GetAllRepoRepo wallet = GetAllRepoRepo();

  ScrollController scrollController = ScrollController();
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  
}
