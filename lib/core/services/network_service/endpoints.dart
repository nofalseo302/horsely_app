import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';

class EndPoints {
  ////             Auth    /////////////
  static const baseUrl = "https://crepto.codeella.com/api";
  static const profile = "$baseUrl/profile";
  static const login = "/auth/login";
  static const completeData = "/complete-data";
  static const allmethod = "/payment-methods";
  static const allCurrency = "/data/currencies";
  static const blanc = "/wallet/balance";
  static const register = "/auth/register";
  static const deleteImage = "/delete-image";
  static const allWallet = "/wallet";
  static const transfetr = "/wallet/transfer-usdt";
  static const createWallet = "/wallet/create";
  static const cryptoCurrency = "/data/crypto-currencies";
  static const logout = "/auth/logout";
  static const verfiryAccount = "$baseUrl/auth/verify-account";
  static const resendCode = "$baseUrl/auth/verify-account/re-send-code";
  static const checkCredential = '/forget-password/check-credential';
  static const forgetPasswordCheckOtp = '/forget-password/check-otp';
  static const forgetPasswordReset = '/forget-password/reset-password';
  static const chat = '/chat';
  static const p2p = '/P2P';
  static const sell = 'sell';
  static const buy = 'buy';

  ///                 home         ////////////////////
  static const homeUser = "/client/home";

  static const companyOrders = "/company/orders";
  static const companyProfile = "/client/company/profile/";
  static const review = "/client/company/reviews/";

  static const countries = "/data/countries";
  static const governates = "/data/governorate";
  static const cities = "/data/cities";

  static const departments = '/data/departments';
  static const changePassword = '/profile/update/password';
  static const editProfile = '/profile/update/information';
  static const policy = '/data/about/policy';
  static const aboutUs = '/data/about/about_us';
  static const deleteProfile = '/profile/delete';
  static const completeRegister = '/complete-register';
  static const getPreviousAddresses = "/client/addresses";
  static const userData = "/auth/user-data";
  static const companyData = "/auth/company-data";

  static const order = '$baseUrl/client/orders';
  static const companyOrder = '$baseUrl/company/orders';
  static const notifications = '$baseUrl/notifications';
  static const getChatList = '$baseUrl/chat/list';
  static const chatByUserId = '$baseUrl/chat/';
  static const sendMessage = '$baseUrl/chat/send';
  static const settings = '$baseUrl/data/settings';
  static const createOrder = '$baseUrl/client/orders/create';
  //-----------Pusher Data-------------//
  static String realtimePusherAppId = "1940246";
  static String realtimePusherAppKey = "7c047960c5355676edd4";
  static String realtimePusherAppSecret = "a73cc970d1ba8144928b";
  static String realtimePusherAppCluster = "eu";
  static createChatChannel({required int userId, required int chatId}) {
    return "chat-$chatId-user-$userId";
  }

  static String getNotificationsChannel({
    required String userId,
  }) =>
      "channel-notify-$userId";

  static Future<void> getSettings() async {
    DioImpl dio = DioImpl();

    final response = await dio.get(endPoint: settings);

    final data = response.data['data'];

    await Future.wait([
      CashHelper.setData(
          CacheKeys.realtimePusherAppId, data[CacheKeys.realtimePusherAppId]),
      CashHelper.setData(
          CacheKeys.realtimePusherAppKey, data[CacheKeys.realtimePusherAppKey]),
      CashHelper.setData(CacheKeys.realtimePusherAppSecret,
          data[CacheKeys.realtimePusherAppSecret]),
      CashHelper.setData(CacheKeys.realtimePusherAppCluster,
          data[CacheKeys.realtimePusherAppCluster]),
    ]);

    realtimePusherAppId = data[CacheKeys.realtimePusherAppId];
    realtimePusherAppKey = data[CacheKeys.realtimePusherAppKey];
    realtimePusherAppSecret = data[CacheKeys.realtimePusherAppSecret];
    realtimePusherAppCluster = data[CacheKeys.realtimePusherAppCluster];
  }
}
