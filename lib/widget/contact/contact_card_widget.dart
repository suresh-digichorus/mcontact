import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/utils.dart';

class ContactCardWidget extends StatelessWidget {
  final String imagePath, name, number, email;
  final bool isFavorite;
  final Function onTap, onTapFavorite;
  final int id;
  const ContactCardWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.number,
    required this.email,
    required this.isFavorite,
    required this.onTap,
    required this.onTapFavorite,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(id);
      },
      child: Container(
        constraints: BoxConstraints(
          minWidth: Utils.getScreenSize(context).width * 0.4,
          minHeight: Utils.getScreenSize(context).width * 0.4,
          maxWidth: Utils.getScreenSize(context).width * 0.4,
        ),
        decoration: BoxDecoration(
            color: AppColors.blueff,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.greye1,
                blurRadius: 3,
                offset: const Offset(0, 1),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      imagePath,
                      width: 40,
                    ),
                  ),
                  IconButton(
                    iconSize: 30,
                    onPressed: () {
                      onTapFavorite();
                    },
                    icon: isFavorite
                        ? Icon(
                            Icons.star_purple500_outlined,
                            color: AppColors.yellow57,
                          )
                        : Icon(
                            Icons.star_border,
                            color: AppColors.greye1,
                          ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Text(
                number,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColors.greyc1,
                      fontSize: 12,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  email,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.greyc1,
                        fontSize: 12,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommonCardContainer extends StatelessWidget {
  final Widget child;
  const CommonCardContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blueff,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.greye1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: child,
    );
  }
}
