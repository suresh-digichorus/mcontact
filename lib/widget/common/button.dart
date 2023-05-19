import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool? isEnable;
  final Color? bgColor;
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isEnable,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => isEnable == null || isEnable! ? onTap() : null,
      style: ButtonStyle(
        backgroundColor: bgColor != null
            ? MaterialStateProperty.all(bgColor)
            : MaterialStateProperty.all(
                isEnable == null || isEnable!
                    ? AppColors.bluecf
                    : AppColors.greyc7,
              ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(title),
    );
  }
}

class PrimaryIconButton extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final Color? iconColor;
  final bool isActive;

  const PrimaryIconButton({
    super.key,
    required this.onTap,
    required this.iconData,
    this.iconColor,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onTap(),
      icon: Icon(
        iconData,
        color: isActive ? AppColors.bluecf : AppColors.white,
        size: 30,
      ),
    );
  }
}
