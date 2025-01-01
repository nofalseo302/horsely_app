import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class LiveChatController extends GetxController {
  RxList<Map<String, String>> messages = <Map<String, String>>[].obs;

  void addMessage(String message, String sender) {
    messages.add({'sender': sender, 'message': message});
  }

  var selectedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar("خطأ", "فشل في اختيار الصورة: $e");
    }
  }
}
