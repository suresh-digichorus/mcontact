import 'package:flutter/material.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/widget/containers/containers.dart';

class WelcomeAvatar extends StatelessWidget {
  final String name,filePath; 
  const WelcomeAvatar({
    super.key, required this.name, required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Strings.welcome,
                style:
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14,
                          color: AppColors.blue9b,
                        ),
              ),
              Text(
                name,
                style:
                    Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 16,
                          color: AppColors.white,
                        ),
              ),
            ],
          ),
        ),
         WhiteBorderAvatar(
          imagePath: filePath,
        )
      ],
    );
  }
}
