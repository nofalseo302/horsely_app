import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/account/features/myorder/data/model/my_orders_model/my_orders_model.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';

class MyOrdersRepo {
  static MyOrdersRepo? _instantance;
  MyOrdersRepo._();
  static MyOrdersRepo get instance {
    _instantance ??= MyOrdersRepo._();
    return _instantance!;
  }

  final DioImpl _dioImpl = DioImpl();

  Future<Either<String, MyOrdersModel>> getMyOrdersData(
      {int currentPage = 1, required OfferType type}) async {
    try {
      var response = await _dioImpl.get(
        endPoint: '${EndPoints.myOrders}/${type.name}?page=$currentPage',
      );

      if (response.statusCode == 200) {
        return Right(MyOrdersModel.fromJson(response.data));
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
