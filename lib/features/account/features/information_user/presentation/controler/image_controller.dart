import 'package:get/get.dart';
import 'package:horsely_app/core/services/handel_image_and_pick_image/image_paker_services.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs; // مراقبة للصورة المختارة
  final ImagePickerService _imagePickerService = ImagePickerService();

  void pickImageFromGallery() async {
    final pickedFile = await _imagePickerService.pickImageFromGallery();
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }

  void pickImageFromCamera() async {
    final pickedFile = await _imagePickerService.pickImageFromCamera();
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
  }
}
