import 'package:flutter/material.dart';

class ImageAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  const ImageAvatar({super.key, required this.imagePath, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        imagePath,
        width: size,
      ),
    );
  }
}
