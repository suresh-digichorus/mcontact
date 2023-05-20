import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';

class IconAndValueWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  const IconAndValueWidget(
      {super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 16,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 12,
                color: AppColors.greyc1,
              ),
        )
      ],
    );
  }
}
