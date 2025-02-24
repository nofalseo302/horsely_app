import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/account_setting.dart/presentation/manager/controler/languge_controler.dart';
import 'package:horsely_app/features/home/logic/controler/buttom_sheet_controler.dart';
import 'package:horsely_app/features/home/logic/controler/home_controller.dart';
import 'package:horsely_app/features/home/logic/controler/payment_controller.dart';
import 'package:horsely_app/features/home/logic/controler/rating_controler.dart';
import 'package:horsely_app/features/home/logic/controler/silder_controler.dart';
import 'package:horsely_app/features/home/logic/controler/tab_bart_controler.dart';
import 'package:horsely_app/features/profit/presentation/manager/controler/tap_bar_profit_controler.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // استخدام Get.put لربط عدة Controllers
    Get.put<HomeControler>(HomeControler());
    Get.put(PaymentController(),permanent: true);
    Get.put<ItemTypeController>(ItemTypeController());
    Get.put<RatingController>(RatingController());
    Get.put<SliderController>(SliderController());
    //Get.put<TapBarController>(TapBarController());
    // Get.put<AccountController>(AccountController());
    Get.put<TapBarProfitControler>(TapBarProfitControler());
    Get.put<LanguageController>(LanguageController());

    //
  }
}
