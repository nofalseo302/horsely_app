import 'package:dartz/dartz.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:get/get.dart';

class ChangePasswordRepo {
  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, String>> changePassword(
      {required Map data}) async {
    try {
      d.Response response = await _dioImpl.post(
          endPoint: '${EndPoints.profile}/update/password', data: data);
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(ResponseMessage.fromJson(response.data));
      }
    } on PrimaryServerException catch (e) {
      return Left(
          ResponseMessage(message: e.message.toString(), status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }
}
