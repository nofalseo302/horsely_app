import 'dart:async';

import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/pusher_service/pusher_service.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_list_model/chat_list_model.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_model/chat_model.dart';
import 'package:horsely_app/features/chat_feature/data/repo/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  RxBool isEmptyMessage = false.obs;
  RxBool isRecording = false.obs;
  RxBool isLoading = false.obs;
  Rxn<Timer> timer = Rxn<Timer>();
  RxInt timerTime = 0.obs;
  TextEditingController messageController = TextEditingController();
  PusherRemoteDataSource pusherRemoteDataSource = PusherRemoteDataSource();
  StreamController? messagesControllerStream;
  ScrollController scrollController = ScrollController();
  ChatRepo chatRepo = ChatRepo();
  Rxn<ChatModel> chatModel = Rxn<ChatModel>();

  void startRecording() {
    print("start recording");
    isRecording.value = true;
    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerTime.value++;
      print(timerTime.value);
    });
  }

  void stopRecording() {
    print("stop recording");
    isRecording.value = false;
    timer.value?.cancel();
    timer.value = null;
    timerTime.value = 0;
  }

  bool canSendMessages = false;

  sendMessage({required String chatId}) async {
    var res = await chatRepo.sendMessage(
      chatId: chatId,
      message: messageController.text,
    );
    res.fold(
      (l) {
        ToastManager.showError(l.message);
      },
      (r) {
        ToastManager.showSuccess("Message sent successfully", true);
      },
    );
  }

  @override
  Future<void> onInit() async {
    // await getChatData();
    print(CashHelper.getData('token'));
    await getAllChats();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  String formatSecondsToHHmm(int totalSeconds) =>
      "${(totalSeconds ~/ 3600).toString().padLeft(2, '0')}:${((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}";
  ChatListModel? usersListModel;
  int currentPage = 1;
  bool getAllChatsLoading = false;
  Future<void> getAllChats({bool? pageinate = false}) async {
    getAllChatsLoading = true;
    update();
    var result =
        await chatRepo.getChatList(currentPage: currentPage, search: '');
    result.fold((l) {
      ToastManager.showError(l);
    }, (r) {
      if (!pageinate!) {
        usersListModel = r;
      } else {
        currentPage++;
        usersListModel!.data!.chats!.data?.addAll(r.data?.chats?.data ?? []);
      }
      getAllChatsLoading = false;
    });
    update();
  }

  void _scrollListener() async {
    if (usersListModel != null &&
        usersListModel!.data!.chats!.meta!.lastPage! >= currentPage &&
        scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      await getAllChats(pageinate: true);
    }
  }

  int? currentUserIndex;
  setCurrentUserIndex(int index) {
    currentUserIndex = index;
    update();
  }
}
