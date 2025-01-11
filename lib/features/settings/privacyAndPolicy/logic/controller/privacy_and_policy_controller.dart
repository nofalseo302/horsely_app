import 'package:get/get.dart';
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
