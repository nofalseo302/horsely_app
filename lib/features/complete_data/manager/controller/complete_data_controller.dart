import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/complete_data/data/repo/complete_data_repo.dart';
import 'package:horsely_app/main.dart';

class CompleteDataController extends GetxController {
  RxList<File?> selectedFile = RxList<File?>();
  TextEditingController jobType = TextEditingController();
  TextEditingController workAddress = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  CompleteDataRepo completeDataRepo = CompleteDataRepo();
  var formKey = GlobalKey<FormState>();

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: [
          "webm",
          "mkv",
          "flv",
          "mp4",
          "jpg",
          "jpeg",
          "png",
          "pdf",
          "doc",
          "docs"
        ]);

    if (result != null) {
      // selectedFile.value = File(result.files.single.path!);
      for (var element in result.files) {
        if (selectedFile.length < 5) {
          selectedFile.add(File(element.path!));
        } else {
          ToastManager.showError(AppStrings.uploadOnly5Images.tr);
          continue;
        }
      }
    }
  }

  bool get hasSelectedFile => selectedFile.value != null;

  void removeFile(int index) {
    selectedFile.removeAt(index);
  }

  submit() async {
    d.FormData formData = d.FormData.fromMap(
      {
        'job_type': jobType.text.trim(),
        'work_address': workAddress.text.trim(),
        'company_name': companyName.text.trim(),
        'tax_number': taxNumber.text.trim(),
        // 'attachments[]': "",
        ////max 5
      },
    );
    for (var element in selectedFile) {
      formData.files.add(
        MapEntry(
          'attachments[]',
          d.MultipartFile.fromFileSync(element!.path),
        ),
      );
    }
    var res = await completeDataRepo.completeData(data: formData);
    res.fold(
      (l) => ToastManager.showError(l.message),
      (r) {
        getRoute(r);
      },
    );
  }
}
