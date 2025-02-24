import 'package:get/get.dart';

class ItemTypeController extends GetxController {
  var selectedItem = 0.obs; // عنصر مختار افتراضيًا (0 يعني العنصر الأول)

  void selectItem(int index) {
    selectedItem.value = index; // تحديث العنصر المختار عند الضغط
  }
}
