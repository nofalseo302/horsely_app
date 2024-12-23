import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:horsely_app/core/services/cache/user_service.dart';
import 'package:horsely_app/features/complete_data/data/repo/complete_data_repo.dart';

class CompleteDataController extends GetxController {
  Rx<File?> selectedFile = Rx<File?>(null);
  TextEditingController jobType = TextEditingController();
  TextEditingController workAddress = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  CompleteDataRepo completeDataRepo = CompleteDataRepo();

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

  submit() async {
    d.FormData formData = d.FormData.fromMap({
      'name': 'abdelfadeil',
      'email': 'Bertrand.Gerhold@gmail.com',
      'password': '123456789',
      'password_confirmation': '123456789',
      'date_of_birth': '2014-09-02',
      'mobile_country_code': UserService.to.currentUser?.value?.data?.mobileCountryCode ?? "",
      'mobile': UserService.to.currentUser?.value?.data?.mobile??"",
      'fcm_token': await FirebaseMessaging.instance.getToken() ?? ""
    });
    var res = completeDataRepo.completeData(data: formData);
  }
}
