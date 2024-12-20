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

class RegisterRepo {
  static final RegisterRepo _instance = RegisterRepo._internal();
  RegisterRepo._internal();
  factory RegisterRepo() {
    return _instance;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, UserModel>> register(
      {required String name,
      required String email,
      required String date,
      required String phoneNumber,
      required String countryCode,
      required String password,
      required String confirmpassword,
      required String fcmToken}) async {
    try {
      var response = await _dioImpl.post(
        endPoint: EndPoints.register,
        data: {
          'name': name,
          'mobile': phoneNumber,
          'mobile_country_code': countryCode,
          'date_of_birth': date,
          'email': email,
          'password': password,
          'password_confirmation': confirmpassword,
          'fcm_token': "fdsfdf",
        },
      );

      if (response.statusCode == 200) {
        CashHelper.setData(
            CacheKeys.token, response.data['data']['token'].toString());
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
