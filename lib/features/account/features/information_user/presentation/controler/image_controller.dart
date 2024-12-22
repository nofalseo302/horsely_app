import 'dart:convert';
import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:horsely_app/core/services/cache/cash_keys.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/core/services/handel_image_and_pick_image/image_paker_services.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/auth/data/model/user_model.dart';
import 'package:dio/dio.dart' as d;
import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:horsely_app/features/information_user/data/repo/repo/edit_profile_repo.dart';
import 'package:horsely_app/routes/routes.dart';

class ImageController extends GetxController {
  var selectedImagePath = ''.obs;
  final ImagePickerService _imagePickerService = ImagePickerService();
  UserModel? userModel;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final EditProfileRepo _editProfileRepo = EditProfileRepo();

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

  editProfile() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      d.FormData data = d.FormData.fromMap({
        'name': nameController.text.trim(),
        "email": emailController.text,
        'mobile_country_code': "+20",
        'mobile': '15${Random().nextInt(900000) + 100000}',
      });

      if (!selectedImagePath.value.startsWith("http://") &&
          !selectedImagePath.value.startsWith("https://")) {
        data.files.add(
          MapEntry(
            'image',
            await multipart_file.MultipartFile.fromFile(
              selectedImagePath.value,
              filename: selectedImagePath.value +
                  DateTime.now().millisecondsSinceEpoch.toString(),
            ),
          ),
        );
      }

      var res = await _editProfileRepo.editProfile(data: data);
      stopLoading();
      res.fold(
        (l) => ToastManager.showError(l.message),
        (r) {
          if (!r.data!.emailVerifiedAt!) {
            CashHelper.sharedPreferences?.clear();
            Get.offAllNamed(Routes.login);
          } else {
            // userModel = UserModel.fromJson(
            //     json.decode(CashHelper.getData(CacheKeys.userModel)));
            UserService.to.setUser(r);
          }

          ToastManager.showSuccess(r.message.toString(), true);
        },
      );
    }
  }

  @override
  void onInit() {
    userModel = UserService.to.currentUser?.value;
    nameController.text = userModel?.data?.name ?? '';
    emailController.text = userModel?.data?.email ?? '';
    selectedImagePath.value = userModel?.data?.image ?? '';
    super.onInit();
  }
}
