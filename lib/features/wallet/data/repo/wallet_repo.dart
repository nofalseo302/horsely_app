import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/wallet/data/model/all_wallet_model/all_wallet_model.dart';
import 'package:horsely_app/features/wallet/data/model/create_wallet_response/create_wallet_response.dart';

import 'package:horsely_app/features/wallet/data/model/get_blance_model/get_blance_model.dart';

class GetAllRepoRepo {
  static final GetAllRepoRepo _orderRepo = GetAllRepoRepo._internal();
  GetAllRepoRepo._internal();
  factory GetAllRepoRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();

  Future<Either<ResponseMessage, AllWalletModel>> getData({
    int? page = 1,
  }) async {
    try {
      var req =
          await _dioHelper.get(endPoint: "${EndPoints.allWallet}?page=$page");

      if (req.statusCode == 200) {
        return Right(AllWalletModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on ResponseMessage catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, CreateWalletResponse>> createWallet({
    int? id = 6,
  }) async {
    try {
      var req = await _dioHelper.post(
          endPoint: EndPoints.createWallet, data: {'crypto_currency_id': id});

      if (req.statusCode == 200) {
        return Right(CreateWalletResponse.fromJson(req.data));
      } else {
        return Left(
            ResponseMessage(message: req.data['message'], status: false));
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, GetBlancModel>> getBalance(
      {required String walletid}) async {
    try {
      var req = await _dioHelper.get(
        endPoint: "${EndPoints.blanc}/$walletid",
      );

      if (req.statusCode == 200) {
        return Right(GetBlancModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on ResponseMessage catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }

  Future<Either<ResponseMessage, ResponseMessage>> transfer(
      {int? id = 6, required String amount, required String toAdderss}) async {
    try {
      var req = await _dioHelper.post(
          endPoint: EndPoints.transfetr,
          data: {'wallet_id': id, "to_address": toAdderss, "amount": amount});

      if (req.statusCode == 200) {
        return Right(ResponseMessage.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on ResponseMessage catch (e) {
      return Left(e);
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message.tr, status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }
}
