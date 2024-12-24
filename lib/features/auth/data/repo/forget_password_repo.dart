import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/features/auth/data/model/user_model/user_model.dart';
import '../../../../core/models/errors/error_message_model.dart';
import '../../../../core/models/errors/exceptions.dart';
import '../../../../core/services/cache/cash_helper.dart';
import '../../../../core/services/cache/cash_keys.dart';
import '../../../../core/services/network_service/api_service.dart';
import '../../../../core/services/network_service/endpoints.dart';
import '../../../../core/services/translation/app_string.dart';

class ForgetPasswordRepo {
  static final ForgetPasswordRepo _instance = ForgetPasswordRepo._internal();
  ForgetPasswordRepo._internal();
  factory ForgetPasswordRepo() {
    return _instance;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, String>> checkCredential(
      {required String email}) async {
    try {
      d.Response response = await _dioImpl.post(
        endPoint: EndPoints.checkCredential,
        data: {'mobile_or_email': email},
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status']));
      }
    } on PrimaryServerException catch (_) {
      return Left(ResponseMessage(message: _.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, String>> forgetPasswordCheckOtp({
    required String email,
    required String otp,
  }) async {
    try {
      d.Response response = await _dioImpl.post(
        endPoint: EndPoints.forgetPasswordCheckOtp,
        data: {'mobile_or_email': email, 'otp': otp},
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status']));
      }
    } on PrimaryServerException catch (_) {
      return Left(ResponseMessage(message: _.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, UserModel>> resetPassword({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String otp,
  }) async {
    try {
      d.Response response = await _dioImpl.post(
        endPoint: EndPoints.forgetPasswordReset,
        data: {
          'mobile_or_email': email,
          'password_confirmation': passwordConfirmation,
          'password': password,
          'otp': otp,
        },
      );

      if (response.statusCode == 200) {
        CashHelper.setData(
            CacheKeys.token, response.data['data']['token'].toString());
        CashHelper.setData(CacheKeys.userModel, json.encode(response.data));
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status']));
      }
    } on PrimaryServerException catch (_) {
      return Left(ResponseMessage(message: _.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }
}
