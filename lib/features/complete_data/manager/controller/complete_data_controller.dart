import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;
import 'package:file_picker/file_picker.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/custom_loader.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:horsely_app/features/complete_data/data/model/complete_data/attachment.dart';
import 'package:horsely_app/features/complete_data/data/model/complete_data/complete_data.dart';
import 'package:horsely_app/features/complete_data/data/repo/complete_data_repo.dart';
import 'package:horsely_app/main.dart';

class CompleteDataController extends GetxController {
  RxList<Attachment?> selectedFile = RxList<Attachment?>();
  TextEditingController jobType = TextEditingController();
  TextEditingController workAddress = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController taxNumber = TextEditingController();
  CompleteDataRepo completeDataRepo = CompleteDataRepo();
  var formKey = GlobalKey<FormState>();
  CompleteDataModel completeDataModel = CompleteDataModel();

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
          selectedFile.add(
            Attachment(
              path: element.path.toString(),
              id: 0,
            ),
          );
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
      },
    );
    for (var element in selectedFile) {
      if (!element!.path!.contains('http')) {
        formData.files.add(
          MapEntry(
            'attachments[]',
            d.MultipartFile.fromFileSync(File(element.path!).path),
          ),
        );
      }
    }
    log(formData.files.toString());
    startLoading();
    var res = await completeDataRepo.completeData(data: formData);
    stopLoading();
    res.fold(
      (l) => ToastManager.showError(l.message),
      (r) {
        Get.offAllNamed(getRoute(r));
      },
    );
  }

  getData() async {
    var res = await completeDataRepo.getCompleteData();
    res.fold(
      (l) => ToastManager.showError(l.message),
      (r) {
        completeDataModel = r;
        // getRoute(r);
        jobType.text = r.data?.jobType ?? '';
        workAddress.text = r.data?.workAddress ?? '';
        companyName.text = r.data?.companyName ?? '';
        taxNumber.text = r.data?.taxNumber ?? '';
        r.data?.attachments?.forEach((element) {
          selectedFile.add(element);
        });
        // Get.offAllNamed(getRoute(r));
      },
    );
  }

  deleteImage({
    required String id,
  }) async {
    var res = await completeDataRepo.deleteImage(id: id); //delete-image
    res.fold(
      (l) => ToastManager.showError(l.message),
      (r) {
        selectedFile.removeWhere((element) => element!.id == int.parse(id));
        ToastManager.showSuccess(r, true);
        // Get.offAllNamed(getRoute(r));
      },
    );
  }

  @override
  void onInit() {
    bool isEdit =
        (Get.arguments != null && Get.arguments.containsKey('isEdit'));
    if (Get.arguments != null && isEdit) {
      getData();
    }

    super.onInit();
  }
}
