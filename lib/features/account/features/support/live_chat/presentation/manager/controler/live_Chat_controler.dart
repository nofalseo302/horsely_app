import 'package:get/get.dart';

class LiveChatController extends GetxController {
  // قائمة لتخزين الرسائل
  RxList<Map<String, String>> messages = <Map<String, String>>[].obs;

  // دالة لإضافة رسالة جديدة
  void addMessage(String message, String sender) {
    messages.add({'sender': sender, 'message': message});
  }
}
