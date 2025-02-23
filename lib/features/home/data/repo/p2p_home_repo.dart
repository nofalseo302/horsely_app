import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/notiofaction/data/model/notification_model.dart';

import '../../../../core/services/network_service/api_service.dart';

class P2pHomeRepo {
  static P2pHomeRepo? _instantance;
  P2pHomeRepo._();
  static P2pHomeRepo get instants {
    _instantance ??= P2pHomeRepo._();
    return _instantance!;
  }

  final DioImpl _dioImpl = DioImpl();
  Future<Either<String, NotificationsModel>> getAllNotifications(
      {int? page}) async {
    try {
      d.Response req = await _dioImpl.get(
          endPoint: "${EndPoints.baseUrl}/notifications?page=$page");
      if (req.statusCode == 200) {
        return Right(NotificationsModel.fromJson(req.data));
      } else {
        return Left(req.data['message'].toString());
      }
    } on PrimaryServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(AppStrings.connectionError.tr);
    }
  }

  Future<Either<String, String>> deleteNotificationById(
      {required int id}) async {
    try {
      d.Response req = await _dioImpl.post(
          data: {'notification_id': id},
          endPoint: "${EndPoints.baseUrl}/notifications/delete");
      if (req.statusCode == 200) {
        return Right(req.data['message'] ?? "");
      } else {
        return Left(req.data['message'] ?? '');
      }
    } on PrimaryServerException catch (e) {
      return Left(e.message);
    } catch (e) {
      return Left(AppStrings.processFailed.tr);
    }
  }
}
