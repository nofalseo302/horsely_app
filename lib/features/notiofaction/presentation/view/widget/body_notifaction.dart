import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/widget/custom_retry_widget.dart';
import 'package:horsely_app/features/notiofaction/presentation/view/widget/iteam_notifaction.dart';

import '../../../logic/controller/notifcations_controller.dart';

class BodyNotifaction extends GetView<NotificationsController> {
  const BodyNotifaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 4,
                spreadRadius: -3)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            GetBuilder<NotificationsController>(builder: (controller) {
              return controller.notificationIsLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.notificationModel == null
                      ? Center(
                          child: RetryWidget(onRetry: () async {
                            await controller.getAllNotification();
                          }),
                        )
                      : controller.notificationModel!.data!.data!.isEmpty
                          ? const Center(child: Text('No Notification'))
                          : Expanded(
                              child: ListView.builder(
                                  controller: controller.scrollController,
                                  itemCount: controller.notificationModel?.data
                                          ?.data?.length ??
                                      0,
                                  itemBuilder: (context, index) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 8.0),
                                        child: IteamNotifaction(
                                          data: controller.notificationModel!
                                              .data!.data![index],
                                        ),
                                      )));
            })
          ],
        ),
      ),
    );
  }
}
