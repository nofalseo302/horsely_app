import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:horsely_app/core/services/translation/app_string.dart';
import 'package:horsely_app/core/widget/toast_manager_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFunctions {
  static Future<void> launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not open email client';
    }
  }

// Function to launch the phone dialer
  static Future<void> launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      throw 'Could not open phone dialer';
    }
  }

  static Future<List<String?>> _processFiles(List<String> filePaths) async {
    const List<String> allowedExtensions = [
      'png',
      'jpeg',
      'jpg',
      'pdf',
      'mp4',
      'flv',
      'mkv'
    ];

    final List<String?> filteredPaths = [];
    for (var filePath in filePaths) {
      final file = File(filePath);
      final fileSizeInBytes = await file.length();
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      final fileExtension = filePath.split('.').last.toLowerCase();

      if (fileSizeInMB <= 5) {
        if (allowedExtensions.contains(fileExtension)) {
          filteredPaths.add(filePath);
        } else {
          ToastManager.showError(
              'Only the following file types are allowed: ${allowedExtensions.join(', ')}');
        }
      } else {
        ToastManager.showError('File size should be less than 5 MB');
      }
    }
    return filteredPaths;
  }

  static bool _isFilePickerActive = false;

  static Future<List<String?>> pickImagesVideos({
    int maxImages = 1,
  }) async {
    if (_isFilePickerActive) return [];
    _isFilePickerActive = true;

    try {
      final ImagePicker picker = ImagePicker();
      final String? option = await showModalBottomSheet<String>(
        context: Get.context!,
        builder: (BuildContext context) {
          return SizedBox(
            height: 150,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(AppStrings.gallery.tr),
                  onTap: () => Navigator.of(context).pop('gallery'),
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: Text(AppStrings.camera.tr),
                  onTap: () => Navigator.of(context).pop('camera'),
                ),
              ],
            ),
          );
        },
      );
      if (option == 'gallery') {
        if (maxImages == 1) {
          final pickedFile = await picker.pickImage(
            source: ImageSource.gallery,
          );
          return _processFiles(pickedFile != null ? [pickedFile.path] : []);
        }
        final pickedFiles = await picker.pickMultiImage(
          limit: maxImages,
        );
        return _processFiles(pickedFiles.map((file) => file.path).toList());
      } else if (option == 'camera') {
        final pickedFile = await picker.pickImage(source: ImageSource.camera);
        return _processFiles(pickedFile != null ? [pickedFile.path] : []);
      }
    } finally {
      _isFilePickerActive = false;
    }

    return [];
  }
}
