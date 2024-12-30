import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthController extends GetxController {
  var isLocalAuth = false.obs;
  var isAuth = false.obs;
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> checkLocalAuth() async {
    isLocalAuth.value = await auth.canCheckBiometrics;
  }

  Future<void> checkAuth() async {
    isAuth.value = await auth.authenticate(
      localizedReason: 'Scan your fingerprint to authenticate',
      options: const AuthenticationOptions(biometricOnly: true),
    );
  }

  @override
  Future<void> onInit() async {
    await checkLocalAuth();
    checkAuth();
    super.onInit();
  }
}
