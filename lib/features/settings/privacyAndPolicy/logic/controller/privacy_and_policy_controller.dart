import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/settings/privacyAndPolicy/data/repo/privacy_and_policy_repo.dart';

class PrivacyAndPolicyController extends GetxController {
  PrivacyAndPolicyRepo settingsRepo = PrivacyAndPolicyRepo();
  String? policy;
  RxBool isLoading = false.obs;
  RxBool hasError = false.obs;

  Future getPolicy() async {
    isLoading.value = true;
    hasError.value = false;
    var result = await settingsRepo.policy();
    result.fold((failure) {
      ToastManager.showError(failure.message.toString());
      isLoading.value = false;
      hasError.value = true;
      hasError.value = true;
    }, (result) async {
      policy = result;
      isLoading.value = false;
      hasError.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    getPolicy();
  }
}
