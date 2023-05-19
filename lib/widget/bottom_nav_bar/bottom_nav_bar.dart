import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/utils.dart';
import 'package:mcontact/widget/common/button.dart';

class BottomNavBar extends StatelessWidget {
  final List<bool> isActive;
  final Function onTap;
  const BottomNavBar({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Utils.getScreenSize(context).width * 0.2),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryIconButton(
                  onTap: () {
                    onTap(0);
                  },
                  iconData: Icons.account_circle_rounded,
                  isActive: isActive[0],
                ),
                PrimaryIconButton(
                  onTap: () {
                    onTap(1);
                  },
                  iconData: Icons.qr_code,
                  isActive: isActive[1],
                ),
                PrimaryIconButton(
                  onTap: () {
                    onTap(2);
                  },
                  iconData: Icons.star_purple500_outlined,
                  isActive: isActive[2],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
