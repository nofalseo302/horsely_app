import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/notiofaction/data/model/notification_model.dart';
import 'package:horsely_app/features/notiofaction/data/repo/notification_repo.dart';
import 'package:audioplayers/audioplayers.dart';

class NotificationsController extends GetxController {
  NotificationRepo notificationRepo = NotificationRepo.instants;
  int currentPageIndex = 1;
  bool notificationIsLoading = false;
  String notificationIsError = '';
  NotificationsModel? notificationModel;
  Future<void> getAllNotification({bool? isPagination}) async {
    if (isPagination == null) {
      notificationIsLoading = true;
    }
    notificationIsError = '';
    update();
    var result =
        await notificationRepo.getAllNotifications(page: currentPageIndex);
    result.fold((l) {
      notificationIsError = l;
      ToastManager.showSuccess(l, false);
    }, (r) {
      if (currentPageIndex == 1) {
        notificationModel = r;
      } else {
        notificationModel?.data?.data?.addAll(r.data?.data ?? []);
      }
      currentPageIndex++;
    });
    notificationIsLoading = false;
    update();
  }

  Future<bool> deleteNotificationById(int id) async {
    bool value = false;
    startLoading();
    var result = await notificationRepo.deleteNotificationById(id: id);
    stopLoading();
    result.fold((l) {
      ToastManager.showSuccess(l, false);
      value = false;
    }, (r) async {
      notificationModel?.data?.data?.removeWhere((e) {
        return e.id == id;
      });
      ToastManager.showSuccess(r, true);
      value = true;
    });
    update();
    return value;
  }

  @override
  void onInit() async {
    await getAllNotification();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  ScrollController scrollController = ScrollController();

  void _scrollListener() async {
    if (notificationModel != null &&
        notificationModel!.data!.meta!.lastPage! >= currentPageIndex &&
        scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      await getAllNotification(isPagination: true);
    }
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playMusic() async {
    await _audioPlayer.play(AssetSource('music/peel.mp3'));
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
