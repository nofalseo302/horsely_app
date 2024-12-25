import 'package:get/get.dart';
import 'package:horsely_app/features/settings/privacyAndPolicy/logic/controller/privacy_and_policy_controller.dart';

class PrivacyAndPolicyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyAndPolicyController>(
      () => PrivacyAndPolicyController(),
    );
  }
}
