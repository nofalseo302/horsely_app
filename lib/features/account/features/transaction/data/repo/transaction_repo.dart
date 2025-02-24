import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

import 'package:horsely_app/features/account/features/transaction/data/model/creatp2p_model/creatp2p_model.dart';

class TransactionRepo {
  static final TransactionRepo _orderRepo = TransactionRepo._internal();
  TransactionRepo._internal();
  factory TransactionRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();
  Future<Either<ResponseMessage, Creatp2pModel>> createPayAndSell({
    required String amount,
    required String price,
    required List<String> paymentMethod,
    required String currencyId,
    required String minLimit,
    required String maxLimit,
    required String cyreptoCurrencyId,
    required String description,
    required String type,
  }) async {
    try {
      var req = await _dioHelper.post(endPoint: EndPoints.createWallet, data: {
        'crypto_currency_id': id,
        "currency_id": currencyId,
        "amount": amount,
        "price": price,
        "type": type,
        "description": description,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "payment_methods[]": paymentMethod
      });

      if (req.statusCode == 200) {
        return Right(Creatp2pModel.fromJson(req.data));
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
}
