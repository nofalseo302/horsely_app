import 'package:get/get.dart';
import 'package:horsely_app/features/chat_feature/logic/controller/messages_controller.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(() => MessagesController(), fenix: false);
  }
}
