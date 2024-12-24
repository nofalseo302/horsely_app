import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/account/features/verification_status/data/repo/verification_status_repo.dart';
import 'package:horsely_app/features/auth/data/model/user_model/user_model.dart';

class VerificationStatusController extends GetxController {
  VerificationStatusRepo verificationStatusRepo = VerificationStatusRepo();
  UserModel? userModel;
  bool isLoading = false;

  getUserData() async {
    isLoading = true;
    update();
    var res = await verificationStatusRepo.getUserData();
    isLoading = false;
    update();
    res.fold(
      (l) {
        ToastManager.showError(l.message);
      },
      (r) {
        userModel = r;
      },
    );
  }

  @override
  Future<void> onInit() async {
    await getUserData();
    super.onInit();
  }
}
