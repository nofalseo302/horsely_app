import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/auth/data/model/user_model/user_model.dart';
import 'package:horsely_app/features/complete_data/data/model/complete_data/complete_data.dart';

class CompleteDataRepo {
  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, UserModel>> completeData(
      {required d.FormData data}) async {
    try {
      var response =
          await _dioImpl.post(endPoint: EndPoints.completeData, data: data);
      if (response.statusCode == 200) {
        CashHelper.setData(CacheKeys.token, response.data['data']['token']);
        CashHelper.setData(CacheKeys.userModel, json.encode(response.data));
        UserModel model = UserModel.fromJson(response.data);
        return Right(model);
      } else {
        return Left(
          ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status'],
          ),
        );
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, CompleteDataModel>> getCompleteData() async {
    try {
      var response = await _dioImpl.get(
        endPoint: EndPoints.completeData,
      );
      if (response.statusCode == 200) {
        CompleteDataModel model = CompleteDataModel.fromJson(response.data);
        return Right(model);
      } else {
        return Left(
          ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status'],
          ),
        );
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(
          ResponseMessage(message: AppStrings.processFailed.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, String>> deleteImage(
      {required String id}) async {
    try {
      var response =
          await _dioImpl.post(endPoint: EndPoints.deleteImage, data: {
        'id': id,
      });
      if (response.statusCode == 200) {
        return Right(response.data['message']);
      } else {
        return Left(
          ResponseMessage(
            message: response.data['message'].toString(),
            status: response.data['status'],
          ),
        );
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(
        ResponseMessage(
          message: AppStrings.processFailed.tr,
          status: false,
        ),
      );
    }
  }
}
