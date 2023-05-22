import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mcontact/resources/images.dart';

class ImageAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  const ImageAvatar({super.key, required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: imagePath.isEmpty
          ? Image.asset(
              Images.logo,
              width: size,
            )
          : Image.file(
              width: size,
              height: size,
              File(
                imagePath,
              ),
              fit: BoxFit.cover,
            ),
    );
  }
}
