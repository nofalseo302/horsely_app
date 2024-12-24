import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/auth/data/model/user_model/user_model.dart';

class VerificationStatusRepo {
  DioImpl dioImpl = DioImpl();
  Future<Either<ResponseMessage, UserModel>> getUserData() async {
    try {
      d.Response response = await dioImpl.get(endPoint: EndPoints.userData);

      if (response.statusCode == 200) {
        UserService.to.setUser(UserModel.fromJson(response.data));
        return Right(UserModel.fromJson(response.data));
      } else {
        return Left(ResponseMessage(
            message: response.data['message'].toString(), status: false));
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
