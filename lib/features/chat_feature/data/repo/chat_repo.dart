import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart' as d;
import 'package:horsely_app/core/models/errors/error_message_model.dart';
import 'package:horsely_app/core/models/errors/exceptions.dart';
import 'package:horsely_app/core/services/network_service/api_service.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_list_model/chat_list_model.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_model/chat_model.dart';
import 'package:horsely_app/features/chat_feature/data/model/send_message_model/send_message_model.dart';

class ChatRepo {
  final DioImpl _dioImpl = DioImpl();
  Future<Either<ResponseMessage, ChatModel>> getChatDataByUserId({
    required int userId,
    int? page = 1,
  }) async {
    try {
      var req = await _dioImpl.get(
          endPoint: "${EndPoints.baseUrl}${EndPoints.chat}/$userId?page=$page");

      if (req.statusCode == 200) {
        return Right(ChatModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on PrimaryServerException catch (_) {
      return Left(ResponseMessage(message: _.message, status: false));
    } catch (e) {
      return Left(ResponseMessage(message: e.toString(), status: false));
    }
  }

  Future<Either<ResponseMessage, SendMessageModel>> sendMessage({
    required String chatId,
    required String message,
    String? attach,
  }) async {
    try {
      var data = d.FormData.fromMap({
        "chat_id": chatId,
        "message": message,
      });
      if (attach!.isNotEmpty) {
        data.files.add(
          MapEntry(
            'attach',
            await d.MultipartFile.fromFile(
              attach,
              filename: attach.split('/').last,
            ),
          ),
        );
      }
      var req = await _dioImpl.post(
        endPoint: EndPoints.sendMessage,
        data: data,
      );

      if (req.statusCode == 200) {
        return Right(SendMessageModel.fromJson(req.data));
      } else {
        return Left(ResponseMessage.fromJson(req.data));
      }
    } on PrimaryServerException catch (_) {
      return Left(ResponseMessage(message: _.message, status: false));
    } catch (e) {
      return Left(ResponseMessage(message: e.toString(), status: false));
    }
  }

  Future<Either<String, ChatListModel>> getChatList({
    String? search,
    int? currentPage = 1,
  }) async {
    try {
      var response = await _dioImpl.get(
        endPoint: '${EndPoints.getChatList}?page=${currentPage ?? 1}',
        query: {"search": search},
      );
      if (response.statusCode == 200) {
        return Right(ChatListModel.fromJson(response.data));
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
