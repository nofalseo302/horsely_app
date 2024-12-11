import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedItem = "".obs; // العنصر المختار حاليًا

  // دالة لتحديث العنصر المختار
  void updateSelectedItem(String value) {
    selectedItem.value = value;
  }
}
