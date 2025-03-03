import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/home/data/model/request_model/buy_request.dart';
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

  Future<Either<String, UserHomeData>> getHomeData({
    required HomeDataRequest request,
    int currentPage = 1,
  }) async {
    try {
      Map<String, dynamic> data = request.toMap();

      var response = await _dioImpl.post(
        data: data,
        endPoint: '${EndPoints.p2p}?page=$currentPage',
      );

      if (response.statusCode == 200) {
        return Right(UserHomeData.fromJson(response.data));
      } else {
        return Left(response.data['message']);
      }
    } on PrimaryServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(AppStrings.connectionError.tr);
    }
  }
}
