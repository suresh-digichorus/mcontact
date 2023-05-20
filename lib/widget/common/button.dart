import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final bool? isEnable;
  final Color? bgColor;
  final IconData? icon;
  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isEnable,
    this.bgColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: Icon(icon),
            )
          ],
          Text(title),
        ],
      ),
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
