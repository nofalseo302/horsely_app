import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';

class CreateOfferRepo {
  static final CreateOfferRepo _orderRepo = CreateOfferRepo._internal();
  CreateOfferRepo._internal();
  factory CreateOfferRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();
  Future<Either<ResponseMessage, String>> createOffer({
    required String price,
    required int paymentmeathodId,
    required int orderId,
    required String type,
  }) async {
    try {
      var req = await _dioHelper.post(endPoint: EndPoints.createOffer, data: {
        'payment_method_id': paymentmeathodId,
        "price": price,
        "type": type,
        "order_id": orderId,
      });

      if (req.statusCode == 200) {
        return Right(req.data.toString());
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
