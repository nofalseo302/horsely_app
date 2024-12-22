import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/features/auth/data/model/user_model.dart';
import '../../../../core/models/errors/error_message_model.dart';
import '../../../../core/models/errors/exceptions.dart';
import '../../../../core/services/network_service/api_service.dart';
import '../../../../core/services/network_service/endpoints.dart';
import '../../../../core/services/translation/app_string.dart';

class VerfiryAccountRepo {
  static final VerfiryAccountRepo _instance = VerfiryAccountRepo._internal();
  VerfiryAccountRepo._internal();
  factory VerfiryAccountRepo() {
    return _instance;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, String>> verfiryAccount({
    required String code,
  }) async {
    try {
      d.Response response = await _dioImpl.post(
        endPoint: EndPoints.verfiryAccount,
        data: {'code': code},
      );

      if (response.statusCode == 200) {
        UserService.to.setUser(UserModel.fromJson(response.data));
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

  Future<Either<ResponseMessage, String>> resendCode() async {
    try {
      d.Response response = await _dioImpl.post(endPoint: EndPoints.resendCode);

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
}
