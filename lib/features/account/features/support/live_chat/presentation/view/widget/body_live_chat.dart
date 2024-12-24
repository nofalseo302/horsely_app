import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/features/account/features/support/live_chat/presentation/manager/controler/live_Chat_controler.dart';
import 'package:horsely_app/features/account/features/support/live_chat/presentation/view/widget/Iteam_chat_bot.dart';
import 'package:horsely_app/features/account/features/support/live_chat/presentation/view/widget/iteam_chat_user.dart';
import 'package:horsely_app/features/account/features/support/live_chat/presentation/view/widget/send_section.dart';

class BodyLiveChat extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  BodyLiveChat({super.key});

  @override
  Widget build(BuildContext context) {
    final LiveChatController controller = Get.put(LiveChatController());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                controller: scrollController, // Use the scroll controller
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  var message = controller.messages[index];
                  if (message['sender'] == 'bot') {
                    return const IteamChatBot();
                  } else {
                    return IteamChatUser(message: message['message']!);
                  }
                },
              ),
            ),
          ),
          SendSection(scrollController: scrollController),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
