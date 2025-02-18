import 'package:horsely_app/features/chat_feature/logic/controller/chat_list_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatListController>(() => ChatListController(), fenix: true);
  }
}
