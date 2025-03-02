import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/account/features/myorder/data/model/my_orders_model/my_orders_model.dart';
import 'package:horsely_app/features/account/features/offer/data/model/offers_model/offers_model.dart';

class OffersRepo {
  static OffersRepo? _instantance;
  OffersRepo._();
  static OffersRepo get instance {
    _instantance ??= OffersRepo._();
    return _instantance!;
  }

  final DioImpl _dioImpl = DioImpl();

  Future<Either<String, OffersModel>> getOffersData(
      {int currentPage = 1, required int id}) async {
    try {
      var response = await _dioImpl.get(
        endPoint: '${EndPoints.offers}$id?page=$currentPage',
      );

      if (response.statusCode == 200) {
        return Right(OffersModel.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } on ResponseMessage catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(AppStrings.connectionError.tr);
    }
  }
}
