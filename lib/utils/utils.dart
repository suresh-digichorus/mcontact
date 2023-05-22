import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:mcontact/core/constant/constant.dart';

class Utils {
  static Size getScreenSize(BuildContext context) =>
      MediaQuery.of(context).size;
  static String generateRandomString(int len) {
    var r = Random();

    return List.generate(
            len,
            (index) =>
                Constant.alphaNumeric[r.nextInt(Constant.alphaNumeric.length)])
        .join();
  }

  static Future<CroppedFile?> cropImage(String pickImage) async {
    return await ImageCropper().cropImage(
      sourcePath: pickImage,
      compressFormat: ImageCompressFormat.png,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
  }
}
