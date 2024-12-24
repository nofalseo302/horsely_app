import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/account/domain/entity/account_entity.dart';

class AccountController extends GetxController {
  var account = <AccountEntity>[].obs; // تحويل القائمة إلى RxList
  @override
  void onInit() {
    super.onInit();
    _updateAccountItems();
  }

  void updateAccountOnLocaleChange() {
    _updateAccountItems();
    update(); // لتحديث الودجت عند تغيير اللغة
  }

  void _updateAccountItems() {
    account.value = [
      AccountEntity(
          titel: AppStrings.accountseting.tr,
          image: AppImages.seting,
          onPressed: () {
            Get.toNamed(Routes.seting);
          }),
      AccountEntity(
          titel: AppStrings.transaction.tr,
          image: AppImages.transaction,
          onPressed: () {
            Get.toNamed(Routes.transactionbuyer);
          }),
      AccountEntity(
          titel: AppStrings.myorder.tr,
          image: AppImages.myOrder,
          onPressed: () {
            Get.toNamed(Routes.myorder);
          }),
      AccountEntity(
          titel: AppStrings.transactionhistory.tr,
          image: AppImages.transaction,
          onPressed: () {
            Get.toNamed(Routes.transactionhoistry);
          }),
      AccountEntity(
          titel: AppStrings.notifactionseting.tr,
          image: AppImages.notifaction,
          onPressed: () {
            Get.toNamed(Routes.notifactionseting);
          }),
      AccountEntity(
          titel: AppStrings.verificationstatus.tr,
          image: AppImages.stauts,
          onPressed: () {
            Get.toNamed(Routes.verificationstatus);
          }),
      AccountEntity(
          titel: AppStrings.pincode.tr,
          image: AppImages.pincode,
          onPressed: () {
            Get.toNamed(Routes.pincode);
          }),
      AccountEntity(
          titel: AppStrings.support.tr,
          image: AppImages.pincode,
          onPressed: () {
            Get.toNamed(Routes.support);
          }),
      AccountEntity(
          titel: AppStrings.deleteaccount.tr,
          image: AppImages.deletaccount,
          onPressed: () {}),
      AccountEntity(
          titel: AppStrings.logout.tr,
          image: AppImages.logout,
          onPressed: () {}),
    ];
  }
}
