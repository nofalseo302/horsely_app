
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/wallet/data/model/get_all_wallet_model/get_all_wallet_model.dart';


class GetAllRepoRepo {
  static final GetAllRepoRepo _orderRepo = GetAllRepoRepo._internal();
  GetAllRepoRepo._internal();
  factory GetAllRepoRepo() {
    return _orderRepo;
  }
  final DioImpl _dioHelper = DioImpl();

  Future<Either<ResponseMessage, GetAllWalletModel>> getData({
    int? page = 1,
  }) async {
    try {
      var req = await _dioHelper.get(
          endPoint: "${EndPoints.allWallet}?page=$page");

      if (req.statusCode == 200) {
        return Right(GetAllWalletModel.fromJson(req.data));
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
