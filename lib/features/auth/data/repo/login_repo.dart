import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../../../../core/models/errors/error_message_model.dart';
import '../../../../core/models/errors/exceptions.dart';
import '../../../../core/services/cache/cash_helper.dart';
import '../../../../core/services/cache/cash_keys.dart';
import '../../../../core/services/network_service/api_service.dart';
import '../../../../core/services/network_service/endpoints.dart';
import '../../../../core/services/translation/app_string.dart';
import '../model/user_model.dart';

class LoginRepo {
  static final LoginRepo _instance = LoginRepo._internal();
  LoginRepo._internal();
  factory LoginRepo() {
    return _instance;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, UserModel>> login(
      {required String email,
      required String password,
      required String mobileCountryCode,
      required String fcmToken}) async {
    try {
      var response = await _dioImpl.post(
        endPoint: EndPoints.login,
        data: {
          'mobile_or_email': email,
          'password': password,
          'fcm_token': "fdsfdf",
          'mobile_country_code': mobileCountryCode,
        },
      );
      if (response.statusCode == 200) {
        CashHelper.setData(CacheKeys.token, response.data['data']['token']);
        CashHelper.setData(CacheKeys.userModel, json.encode(response.data));
        UserModel model = UserModel.fromJson(response.data);
        return Right(model);
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status']));
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }
}
