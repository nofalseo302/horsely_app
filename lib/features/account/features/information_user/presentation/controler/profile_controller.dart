import 'package:dio/src/multipart_file.dart' as multipart_file;
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/cache/cash_helper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/widget/custom_loader.dart';
import '../../../../../../core/widget/toast_manager_widget.dart';
import '../../../../../information_user/data/repo/repo/edit_profile_repo.dart';

class ProfileController extends GetxController {
  var selectedImagePath = ''.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController DOBController = TextEditingController();
  RxString Bgimage = "".obs;
  String? name;
  String? email;
  String? image;
  var formKey = GlobalKey<FormState>();
  // UserModel userModel = UserModel.fromJson(
  //   json.decode(
  //     CashHelper.getData(CacheKeys.userModel),
  //   ),
  // );

  final EditProfileRepo _editProfileRepo = EditProfileRepo();
  editProfile() async {
    if (formKey.currentState!.validate()) {
      startLoading();
      d.FormData data = d.FormData.fromMap({
        'name': nameController.text.trim(),
        'mobile_country_code': "+20",
        'mobile': '1552161571',
        "date_of_birth": '01-03-2000',
        "email": emailController.text,
      });

      if (!Bgimage.value.startsWith("http://") &&
          !Bgimage.value.startsWith("https://")) {
        data.files.add(
          MapEntry(
            'image',
            await multipart_file.MultipartFile.fromFile(
              Bgimage.value,
              filename: Bgimage.value +
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
          } else {
            // userModel = UserModel.fromJson(
            //     json.decode(CashHelper.getData(CacheKeys.userModel)));
            // name = userModel.data?.name;
            // email = userModel.data?.email;
            // image = userModel.data?.image;
          }

          ToastManager.showSuccess(r.message.toString(), true);
        },
      );
    }
  }

  Future<bool> checkPermission(ImageSource source) async {
    PermissionStatus status;
    if (source == ImageSource.camera) {
      status = await Permission.camera.request();
    } else {
      status = await Permission.photos.request();
    }
    return status.isGranted;
  }

  pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    Permission.photos.request();
    final XFile? image = await picker.pickImage(
      source: source,
    );
    if (image != null) {
      print(image.path);
      Bgimage.value = image.path;
    }
  }

  // @override
  // void onInit() {
  //   userModel = UserModel.fromJson(
  //       json.decode(CashHelper.getData(CacheKeys.userModel)));
  //   nameController.text = userModel.data?.name ?? '';
  //   emailController.text = userModel.data?.email ?? '';
  //   mobileController.text = userModel.data?.mobile ?? '';
  //   countryCodeController.text = userModel.data?.mobileCountryCode ?? '';
  //   Bgimage.value = userModel.data?.image ?? '';
  //   dateController.text = userModel.data?.dateOfBirth ?? '';
  //   super.onInit();
  // }
}
