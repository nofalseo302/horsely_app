import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
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
    required String? profits,
  }) async {
    try {
      var data = {
        'crypto_currency_id': cyreptoCurrencyId,
        "currency_id": currencyId,
        "amount": amount,
        "price": price,
        "type": type,
        "description": description,
        "min_limit": minLimit,
        "max_limit": maxLimit,
        "payment_methods": paymentMethod.toSet().toList()
      };
      if (profits != null) {
        data.addAll({'profit': profits});
      }
      var post = _dioHelper.post(endPoint: EndPoints.createsell, data: data);
      var req = await post;

      if (req.statusCode == 200) {
        return Right(Creatp2pModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on PrimaryServerException catch (e) {
      return Left(ResponseMessage(message: e.message.tr, status: false));
    } catch (e) {
      return Left(ResponseMessage(
          message: AppStrings.connectionError.tr, status: false));
    }
  }
}
