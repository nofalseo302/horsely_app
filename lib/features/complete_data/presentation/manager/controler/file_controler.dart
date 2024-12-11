import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:file_picker/file_picker.dart';

class FileController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false, // نسمح باختيار ملف واحد فقط
      type: FileType.any, // يمكنك تحديد نوع ملف معين هنا إذا أردت
    );

    if (result != null) {
      selectedFile.value = File(result.files.single.path!);
    }
  }

  bool get hasSelectedFile => selectedFile.value != null;

  void removeFile() {
    selectedFile.value = null; // إعادة تعيين الملف المختار
  }
}
