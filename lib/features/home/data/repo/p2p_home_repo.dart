import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/data/model/user_home_data/user_home_data.dart';

import '../../../../core/services/network_service/api_service.dart';

class P2pHomeRepo {
  static P2pHomeRepo? _instantance;
  P2pHomeRepo._();
  static P2pHomeRepo get instance {
    _instantance ??= P2pHomeRepo._();
    return _instantance!;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<String, UserHomeData>> getSellData({
    String? search,
    int? currentPage = 1,
  }) async {
    try {
      var response = await _dioImpl.post(
        data: {'type': EndPoints.sell, "key_words": search},
        endPoint: '${EndPoints.p2p}?page=${currentPage ?? 1}',
      );
      if (response.statusCode == 200) {
        return Right(UserHomeData.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } on ResponseMessage catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(AppStrings.connectionError.tr);
    }
  }

  Future<Either<String, UserHomeData>> getBuyData({
    String? search,
    int? currentPage = 1,
  }) async {
    try {
      var response = await _dioImpl.post(
        data: {'type': EndPoints.buy, "key_words": search},
        endPoint: '${EndPoints.p2p}?page=${currentPage ?? 1}',
        query: {},
      );
      if (response.statusCode == 200) {
        return Right(UserHomeData.fromJson(response.data));
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
