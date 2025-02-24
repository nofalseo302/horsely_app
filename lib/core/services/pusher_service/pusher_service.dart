import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/network_service/endpoints.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_model/datum.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/messages_controller.dart';

class PusherRemoteDataSource {
  final PusherChannelsFlutter pusher = PusherChannelsFlutter();
  PusherRemoteDataSource();
  // StreamController<OrderStatusModel>? _orderStreamController;
  StreamController? _messagesStreamController;
  // StreamController<UserModel>? _userStreamController;
  // StreamController<UserModel>? _nearestDriversStreamController;
  // StreamController<ChatModel>? _chatStreamController;

  Future<Unit> initPusher() async {
    try {
      // _userStreamController = StreamController();
      // // init pusher

      await pusher.init(
        apiKey: EndPoints.realtimePusherAppKey,
        cluster: EndPoints.realtimePusherAppCluster,
      );

      // // connect to channel
      await pusher.connect();

      // return unit;
      // await subscribeToOrder(driverId: driverId);
      return unit;
    } on SocketException {
      // return Future.delayed(const Duration(seconds: 10), () async {
      //   return await initPusher(driverId: driverId);
      // });
      return unit;
    } catch (error) {
      rethrow;
    }
  }

  // Bind to listen for events called "driver"
  // listenToUserData(PusherEvent event) {
  //   final responseBody = jsonDecode(event.data);

  //   if (responseBody['user'] != null) {
  //     _userStreamController!.add(UserModel.fromMap(responseBody['user']));
  //   }
  // }

// Bind to listen for events called "driver"
  // listenToOrders(PusherEvent event) {
  //   var responseBody = event.data;
  //   if (event.data is! Map) {
  //     responseBody = jsonDecode(event.data);
  //   }
  //   if (responseBody.containsKey('data')) {
  //     _orderStreamController!.add(OrderStatusModel.fromJson(responseBody));
  //   }
  // }

  listenToMessages(PusherEvent event) {
    var responseBody = event.data;
    print(responseBody);
    if (event.data is! Map) {
      responseBody = jsonDecode(event.data);
    }
    if (responseBody.containsKey('data')) {
      print('dfdfdfdfdf $responseBody');
      Message message = Message.fromJson(responseBody['data']);
      _messagesStreamController!.add(message);
      if (Get.isRegistered<MessagesController>()) {
        Get.find<MessagesController>().updateMessage(message);
      }
    }
  }

  // Disconnect from pusher service
  Future<Unit> disconnectPusher() async {
    try {
      pusher.disconnect();
      // _orderStreamController!.close();
      // _userStreamController!.close();
      // _chatStreamController!.close();
      return unit;
    } on SocketException {
      return Future.delayed(const Duration(seconds: 10), () async {
        return await disconnectPusher();
      });
    } catch (error) {
      rethrow;
    }
  }

  // Stream<OrderStatusModel> listenToOrder() {
  //   return _orderStreamController!.stream;
  // }

  // Stream listenToMessage() {
  //   return _messagesStreamController!.stream;
  // }

  // @override
  // Stream<UserModel> listenToUser() {
  //   return _userStreamController!.stream;
  // }

  // Future<Unit> subscribeToOrder({required int driverId}) async {
  //   _orderStreamController = StreamController();

  //   await pusher.subscribe(
  //     channelName: EndPoints.getOrderChannel(id: driverId),
  //     onEvent: (event) => listenToOrders(event),
  //   );

  //   return unit;
  // }

  Future<Unit> subscribeToMessage(
      {required int chatId, required int userId}) async {
    try {
      _messagesStreamController = StreamController();
      // await pusher.connect();
      await pusher.subscribe(
        channelName:
            EndPoints.createChatChannel(chatId: chatId, userId: userId),
        onEvent: (event) => listenToMessages(event),
      );

      return unit;
    } catch (e) {
      return unit;
    }
  }

  //unsubscribe to messages channel
  Future<Unit> unsubscribeToMessage(
      {required int chatId, required int userId}) async {
    _messagesStreamController!.close();
    await pusher.unsubscribe(
      channelName: EndPoints.createChatChannel(chatId: chatId, userId: userId),
    );
    return unit;
  }

  // @override
  // Future<Unit> subscribeToChat({required int orderId}) async {
  //   _chatStreamController = StreamController();

  //   await pusher.subscribe(
  //     channelName: Kstrings.getChatChannel(orderId: orderId),
  //     onEvent: (event) => listenToChats(event),
  //   );

  //   return unit;
  // }

  // listenToChats(PusherEvent event) {
  //   final responseBody = jsonDecode(event.data);

  //   if (responseBody['chat'] != null) {
  //     final ChatModel chatModel = ChatModel.fromMap(responseBody['chat']);
  //     _chatStreamController!.add(chatModel);
  //   }
  // }

  // @override
  // Stream<ChatModel> listenToChat() {
  //   return _chatStreamController!.stream;
  // }

  // @override
  // Future<Unit> subscribeToNearestDrivers({required int driverId}) async {
  //   _chatStreamController = StreamController();

  //   await pusher.subscribe(
  //     channelName: Kstrings.getNearestDriversChannel(driverId: driverId),
  //     onEvent: (event) => listenToNearestDriverss(event),
  //   );

  //   return unit;
  // }

  // listenToNearestDriverss(PusherEvent event) {
  //   final responseBody = jsonDecode(event.data);

  //   _nearestDriversStreamController!
  //       .add(UserModel.fromMap(responseBody['user']));
  // }
}
