import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TextController extends GetxController {
  bool isObscured = true; // حالة النص إذا كان مشفّرًا أو مرئيًا
  String data = "This is  "; // النص الذي تريد عرضه

  void toggleVisibility() {
    isObscured = !isObscured;
    update(); // لتحديث الواجهة
  }

  void copyText() {
    Clipboard.setData(ClipboardData(text: data));
    
  }




  
}
