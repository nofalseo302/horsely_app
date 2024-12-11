import 'package:get/get.dart';
import 'package:horsely_app/features/auth/logic/binding/login_binding.dart';
import 'package:horsely_app/features/auth/logic/binding/register_binding.dart';
import 'package:horsely_app/features/notiofaction/logic/binding/notification_binding.dart';
import 'package:horsely_app/routes/routes.dart';
import 'package:horsely_app/features/accout_seting.dart/presentation/view/account_seting.dart';
import 'package:horsely_app/features/bay_details/presentation/view/buy_details_screen.dart';
import 'package:horsely_app/features/auth/views/change_password/presentation/view/change_password_screen.dart';
import 'package:horsely_app/features/complete_data/presentation/view/complet_data_Screen.dart';
import 'package:horsely_app/features/deposit/presentation/view/deposit_screen.dart';
import 'package:horsely_app/features/auth/views/email_rest/view/email_rest_password_screen.dart';
import 'package:horsely_app/features/history/presentation/view/history_screen.dart';
import 'package:horsely_app/features/home/presentation/manager/binding/home_binding.dart';
import 'package:horsely_app/features/home/presentation/view/home_screen..dart';
import 'package:horsely_app/features/information_user/presentation/view/information_user_screen.dart';
import 'package:horsely_app/features/live_chat/presentation/view/llive_chat_screen.dart';
import 'package:horsely_app/features/auth/views/login/login_screen.dart';
import 'package:horsely_app/features/myorder/presentation/view/my_order_screeen.dart';
import 'package:horsely_app/features/notifacation_Seting/presentation/view/notifaction_seting_screen.dart';
import 'package:horsely_app/features/notiofaction/presentation/view/notifaction_screen.dart';
import 'package:horsely_app/features/on_boarding/presentation/view/on_boarding_screeen.dart';
import 'package:horsely_app/features/pincode/presentation/view/pin_code.dart';
import 'package:horsely_app/features/pindeing_review/presentation/view/pending_review_screen.dart';
import 'package:horsely_app/features/pinding_complete_data/presentation/view/pinding_complete_data_screen.dart';
import 'package:horsely_app/features/auth/views/rest_password/presentation/view/rest_password_screen.dart';
import 'package:horsely_app/features/sell_details/presentation/view/sell_details.dart';
import 'package:horsely_app/features/auth/views/register/sing_up_screen.dart';
import 'package:horsely_app/features/support/presentation/view/support_sceen.dart';
import 'package:horsely_app/features/transactions/tranaction_details/presentation/view/transaction_details_screen.dart';
import 'package:horsely_app/features/transactions/transaction/presentation/view/teanaction_screen.dart';
import 'package:horsely_app/features/transactions/transaction_buyer/presentation/view/transaction_buyer_screen.dart';
import 'package:horsely_app/features/transactions/transaction_history/presentation/view/transaction_history_screen.dart';
import 'package:horsely_app/features/verification_status/presentation/view/widget/verification_status_screen.dart';
import 'package:horsely_app/features/auth/views/verify_account/view/verify_account_screen.dart';
import 'package:horsely_app/features/on_boarding/welcome/presentation/view/welcome_screen.dart';
import 'package:horsely_app/features/withdraw/presentation/view/withdraw_screen.dart';

import '../features/auth/logic/binding/forget_password_binding.dart';

// قم بإضافة جميع الصفحات الأخرى التي تحتاجها هنا

class AppPages {
  static const initial = Routes.onBoarding; // الصفحة الأولية عند فتح التطبيق

  static final pages = [
    GetPage(
      name: Routes.onBoarding,
      page: () => const OnBoardingScreeen(),
      transition: Transition.leftToRight, // يمكنك تعديل الانتقال كما تشاء
    ),
    GetPage(
      name: Routes.welcome,
      page: () => const WelcomeScreen(),
      transition: Transition.leftToRight, // يمكنك تعديل الانتقال كما تشاء
    ),
    GetPage(
      binding: HomeBinding(),
      name: Routes.home,
      page: () => const HomeScreen(),
      transition: Transition.leftToRight, // يمكنك تعديل الانتقال كما تشاء
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
    ),
    GetPage(
      name: Routes.register,
      page: () => const SingUpScreen(),
      binding: RegisterBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.forgetPassword,
      page: () => const EmailRestPasswordScreen(),
      binding: ForgetPasswordBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.verifyAccount,
      page: () => const VerifyAccountScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.restpassword,
      page: () => const RestPasswordScreen(),
      transition: Transition.leftToRight,
    ),

    GetPage(
      name: Routes.otpForgetPassword,
      page: () => const VerifyAccountScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.pindingcompletedata,
      page: () => const PindingCompleteDataScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.completedata,
      page: () => const CompletDataScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.completedata,
      page: () => const PendingReviewScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.buydetails,
      page: () => const BuyDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.notifactionscreen,
      binding: NotificationBinding(),
      page: () => const NotifactionScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.accountSeting,
      page: () => const AccountSeting(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.informationAboutUser,
      page: () => const InformationUserScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.selldetails,
      page: () => const SellDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.deposit,
      page: () => const DepositScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.withdraw,
      page: () => const WithdrawScreen(),
      transition: Transition.leftToRight,
    ),
    //
    GetPage(
      name: Routes.transactiondetails,
      page: () => const TransactionDetailsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.transation,
      page: () => const TeanactionScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.transactionbuyer,
      page: () => const TransactionBuyerScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.myorder,
      page: () => const MyOrderScreeen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.transactionhoistry,
      page: () => const TransactionHistoryScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.notifactionseting,
      page: () => const NotifactionSetingScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.verificationstatus,
      page: () => const VerificationStatusScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.pincode,
      page: () => const PinCode(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.support,
      page: () => const SupportSceen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.informationscreen,
      page: () => const InformationUserScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.changelaunge,
      page: () => const ChangePassword(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.livechat,
      page: () => const LiveChatsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.seting,
      page: () => const AccountSeting(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: Routes.history,
      page: () => const HistoryScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}
