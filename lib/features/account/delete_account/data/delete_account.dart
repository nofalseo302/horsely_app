import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

class DeleteAccountRepo {
  DioImpl dioImpl = DioImpl();
  Future<Either<ResponseMessage, String>> deleteAccount(
      {required String password}) async {
    try {
      d.Response response = await dioImpl.post(
        endPoint: '${EndPoints.profile}/delete',
        data: {'password': password},
      );

      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status']));
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }
}
