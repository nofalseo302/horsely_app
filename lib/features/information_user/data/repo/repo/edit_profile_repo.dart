// ignore_for_file: unused_field, prefer_final_fields

import 'dart:convert';

import 'package:dio/dio.dart' as d;

import 'package:dartz/dartz.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/auth/data/model/user_model/user_model.dart';

import '../../../../../core/models/errors/error_message_model.dart';
import '../../../../../core/services/network_service/api_service.dart';
import '../../../../../core/services/network_service/endpoints.dart';
import 'package:get/get.dart';

class EditProfileRepo {
  DioImpl _dioImpl = DioImpl();

  Future<Either<ResponseMessage, UserModel>> editProfile({
    required d.FormData data,
  }) async {
    try {
      d.Response response = await _dioImpl.post(
          endPoint: '${EndPoints.profile}/update/information', data: data);
      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        CashHelper.setData(CacheKeys.userModel, json.encode(response.data));
        return Right(userModel);
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
