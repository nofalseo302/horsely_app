import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/app_text_styles.dart';
import '../../../data/model/notification_model.dart';
import '../../../logic/controller/notifcations_controller.dart';

class IteamNotifaction extends GetView<NotificationsController> {
  final DataNotifications data;
  const IteamNotifaction({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(data.id.toString()),
      direction: DismissDirection.endToStart, // الاتجاه الذي سيظهر فيه العنصر
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red, // لون خلفية عند السحب
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        child: const Icon(
          Icons.delete, // أيقونة تظهر عند السحب
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) async {
        await controller.deleteNotificationById(data.id!);
        controller.playMusic();
      },
      confirmDismiss: (direction) async {
        var result = await controller.deleteNotificationById(data.id!);
        controller.playMusic();

        // يمكنك إضافة تأكيد الحذف هنا إذا لزم الأمر
        return result; // ارجع true لإكمال عملية السحب
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              blurRadius: 10,
              spreadRadius: -5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.createdAt ?? '',
                style: AppStyles.semibold12(context).copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff545454),
                ),
              ),
              Row(
                children: [
                  Text(
                    data.title ?? '',
                    style: AppStyles.semibold14(context),
                  ),
                  Text(
                    data.message ?? '',
                    style: AppStyles.semibold14(context).copyWith(
                      color: const Color(0xff707070),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
