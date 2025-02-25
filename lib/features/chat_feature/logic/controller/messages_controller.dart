import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:horsely_app/core/function/app_function.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/pusher_service/pusher_service.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_model/chat_model.dart';
import 'package:horsely_app/features/chat_feature/data/model/chat_model/datum.dart';
import 'package:horsely_app/features/chat_feature/data/repo/chat_repo.dart';
import 'package:permission_handler/permission_handler.dart';

class MessagesController extends GetxController {
  RxBool isEmptyMessage = false.obs;
  RxBool isRecording = false.obs;
  RxBool isLoading = false.obs;
  RxBool isSending = false.obs;
  final FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _audioPlayer = FlutterSoundPlayer();
  ScrollController scrollController = ScrollController();

  Rxn<Timer> timer = Rxn<Timer>();
  RxInt timerTime = 0.obs;
  TextEditingController messageController = TextEditingController();
  StreamController? messagesControllerStream;
  late int userID;
  String? _filePath;
  RxString imageMessage = ''.obs;
  Future<void> requestPermission() async {
    var status = await Permission.microphone.request();
    print(status);
    if (status.isDenied || status.isPermanentlyDenied) {
      Permission.microphone.request();
      Get.dialog(
        AlertDialog(
          title: const Text('Microphone Permission Required'),
          content: const Text(
              'This app needs access to your microphone to record audio. Please grant permission in the app settings.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: const Text('Open Settings'),
              onPressed: () {
                openAppSettings();
              },
            ),
          ],
        ),
      );
      // throw Exception("Microphone permission is required to record audio");
    }
  }

  ChatRepo chatRepo = ChatRepo();
  Rxn<ChatModel> chatModel = Rxn<ChatModel>();

  Future<void> startRecording() async {
    print("start recording");
    await requestPermission();

    timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerTime.value++;
      print(timerTime.value);
    });
    _filePath = 'recorded_audio.aac';
    await _audioRecorder.startRecorder(
      toFile: _filePath,
      codec: Codec.aacADTS,
    );
    isRecording.value = true;
  }

  Future<void> stopRecording() async {
    print("stop recording");
    var filePath = await _audioRecorder.stopRecorder();
    print(filePath);
    isRecording.value = false;
    timer.value?.cancel();
    timer.value = null;
    timerTime.value = 0;
    sendMessage(audio: filePath);
  }

  getChatData({
    int? page,
    bool pageinate = false,
  }) async {
    if (page == null) {
      isLoading.value = true;
    } else {
      startLoading();
    }
    update();
    var res = await chatRepo.getChatDataByUserId(
      userId: userID,
      page: page,
    );
    if (page == null) {
      isLoading.value = false;
    } else {
      stopLoading();
    }
    res.fold(
      (l) {
        ToastManager.showError(l.message);
        update();
      },
      (r) async {
        if (page == null) {
          chatModel.value = r;
          await PusherRemoteDataSource().subscribeToMessage(
            chatId: r.data!.chatData!.id!,
            userId: userID,
          );
        } else {
          chatModel.value!.data!.messages!.data!
              .insertAll(0, r.data!.messages!.data!);
          chatModel.value!.data!.messages!.currentPage =
              r.data!.messages!.currentPage;
          chatModel.value!.data!.messages!.from = r.data!.messages!.from;
          chatModel.value!.data!.messages!.to = r.data!.messages!.to;
          chatModel.value!.data!.messages!.lastPage =
              r.data!.messages!.lastPage;
          chatModel.refresh();
        }
        update();
      },
      //all done
    );
  }

  sendMessage({
    String? audio,
  }) async {
    isSending.value = true;
    // print();
    var res = await chatRepo.sendMessage(
      chatId: chatModel.value!.data!.chatData!.id.toString(),
      message: messageController.text,
      attach: audio ?? imageMessage.value,
    );
    res.fold(
      (l) {
        ToastManager.showError(l.message);
        isSending.value = false;
      },
      (r) {
        chatModel.value!.data!.messages!.data?.add(
          Message(
            attach: r.data?.attach ?? "",
            userId: UserService.to.currentUser.value?.data?.id,
            chatId: chatModel.value!.data!.chatData!.id,
            createdAt: DateTime.now(),
            id: -1,
            message: messageController.text,
            updatedAt: DateTime.now(),
          ),
        );
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 300,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        isSending.value = false;
        messageController.clear();
        imageMessage.value = '';
        isEmptyMessage.value = false;
        update();
      },
    );
  }

  pickMessageImage() {
    AppFunctions.pickImagesVideos(
      maxImages: 1,
    ).then(
      (value) {
        if (value.isNotEmpty) {
          imageMessage.value = value[0]!;
        }
      },
    );
  }

  Future<void> _initRecorder() async {
    try {
      await requestPermission();
      await _audioRecorder.openRecorder();
      await _audioPlayer.openPlayer();
    } catch (e) {
      print("Error initializing recorder: $e");
    }
  }

  @override
  Future<void> onInit() async {
    userID = Get.arguments['userId'];
    await getChatData();
    _initRecorder();
    scrollController.addListener(_scrollListner);
    await Future.delayed(const Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.linear, duration: const Duration(seconds: 1));
    });

    super.onInit();
  }

  @override
  void onClose() {
    PusherRemoteDataSource().unsubscribeToMessage(
        chatId: chatModel.value!.data!.chatData!.id!, userId: 1111
        // chatModel.value!.data!.chatData!.driver!.id!,
        );
    _audioRecorder.closeRecorder();
    timer.value?.cancel();
    _audioPlayer.closePlayer();
    super.onClose();
  }

  updateMessage(Message message) async {
    chatModel.value!.data!.messages!.data?.add(
      Message(
        attach: message.attach,
        userId: message.userId,
        chatId: message.userId,
        createdAt: DateTime.now(),
        id: message.id,
        message: message.message,
        updatedAt: DateTime.now(),
      ),
    );
    update();
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  _scrollListner() async {
    if (scrollController.position.pixels ==
            scrollController.position.minScrollExtent &&
        chatModel.value!.data!.messages!.currentPage! <
            chatModel.value!.data!.messages!.lastPage!) {
      print("top--------------------------");
      await getChatData(
        page: chatModel.value!.data!.messages!.currentPage! + 1,
      );
    }
  }

  // void _scrollListner() async {
  //   if (scrollController.offset >= scrollController.position.maxScrollExtent &&
  //       !scrollController.position.outOfRange &&
  //       !isLoading.value) {
  //     if (chatModel.value!.data!.messages!.currentPage! <
  //         chatModel.value!.data!.messages!.lastPage!) {
  //       await getChatData(
  //         pageinate: true,
  //       );
  //     }
  //   }
  // }

  String formatSecondsToHHmm(int totalSeconds) =>
      "${(totalSeconds ~/ 3600).toString().padLeft(2, '0')}:${((totalSeconds % 3600) ~/ 60).toString().padLeft(2, '0')}";
}
