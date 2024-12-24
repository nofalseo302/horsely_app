import 'package:dartz/dartz.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

class PrivacyAndPolicyRepo {
  DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, String>> policy() async {
    try {
      d.Response response = await _dioImpl.get(
        endPoint: EndPoints.policy,
        data: {},
      );
      if (response.statusCode == 200) {
        return Right(response.data['data']['description']);
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(), status: false));
      }
    } on PrimaryServerException catch (e) {
      return Left(
          ResponseMessage(message: e.message.toString(), status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.connectionError, status: false));
    }
  }
}
