import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class WhiteBorderAvatar extends StatelessWidget {
  final String imagePath;
  const WhiteBorderAvatar({
    super.key, required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: AppColors.white,
        ),
      ),
      width: 50,
      height: 50,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset(
           imagePath
          ),
        ),
      ),
    );
  }
}
