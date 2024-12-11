import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/utils/image/app_images_svg.dart';
import 'package:horsely_app/core/widget/send_text_filed.dart';
import 'package:horsely_app/features/live_chat/presentation/manager/controler/live_Chat_controler.dart';

class SendSection extends StatelessWidget {
  final ScrollController scrollController;

  SendSection({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final LiveChatController controller = Get.find();
    final TextEditingController messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        children: [
          Image.asset(AppImages.camer),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: SendTextFiled(
                controller: messageController, // Pass the controller here
                suffixIcon: Icon(Icons.emoji_emotions_outlined,
                    color: Color(0xff28303F)),
                hintText: "Message...",
                textInputType: TextInputType.text,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          GestureDetector(
            onTap: () {
              if (messageController.text.isNotEmpty) {
                // إرسال رسالة المستخدم
                controller.addMessage(messageController.text, 'user');

                // مسح النص بعد الإرسال
                messageController.clear();

                // تمرير القائمة إلى الأسفل لرؤية الرسالة المضافة
                scrollController.animateTo(
                  scrollController.position.maxScrollExtent,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );

                // إضافة رد روبوت (اختياري - يمكنك تخصيص الرد)
                Future.delayed(Duration(seconds: 1), () {
                  controller.addMessage("This is a bot response", 'bot');

                  // تمرير القائمة إلى الأسفل لرؤية رد الروبوت
                  scrollController.animateTo(
                    scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                  );
                });
              }
            },
            child: Image.asset(AppImages.send),
          ),
        ],
      ),
    );
  }
}
