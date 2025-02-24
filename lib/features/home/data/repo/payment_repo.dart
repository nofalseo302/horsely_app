import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/data/model/all_currency_model/all_currency_model.dart';
import 'package:horsely_app/features/home/data/model/all_payment_method/all_payment_method.dart';
import 'package:horsely_app/features/home/data/model/crypto_currency_model/crypto_currency_model.dart';

class PaymentRepo {
  static final PaymentRepo _orderRepo = PaymentRepo._internal();
  PaymentRepo._internal();
  factory PaymentRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();
  Future<Either<ResponseMessage, AllPaymentMethod>> getAllPayment() async {
    try {
      var req = await _dioHelper.get(
        endPoint: EndPoints.allmethod,
      );

      if (req.statusCode == 200) {
        return Right(AllPaymentMethod.fromJson(req.data));
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

  Future<Either<ResponseMessage, AllCurrencyModel>> getAllCurrency() async {
    try {
      var req = await _dioHelper.get(
        endPoint: EndPoints.allCurrency,
      );

      if (req.statusCode == 200) {
        return Right(AllCurrencyModel.fromJson(req.data));
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

  Future<Either<ResponseMessage, CryptoCurrencyModel>>
      getCryptoCurrency() async {
    try {
      var req = await _dioHelper.get(
        endPoint: EndPoints.cryptoCurrency,
      );

      if (req.statusCode == 200) {
        return Right(CryptoCurrencyModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on ResponseMessage catch (e) {
      return Left(ResponseMessage(message: e.message, status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }
}
