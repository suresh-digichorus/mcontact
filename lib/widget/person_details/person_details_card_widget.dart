import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mcontact/core/model/contact_details_list_temp.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/widget/common/image_avatar_widget.dart';
import 'package:mcontact/widget/person_details/icon_value_widget.dart';

class PersonDetailsCardWidget extends StatefulWidget {
  final Person person;
  const PersonDetailsCardWidget({super.key, required this.person});

  @override
  State<PersonDetailsCardWidget> createState() =>
      _PersonDetailsCardWidgetState();
}

class _PersonDetailsCardWidgetState extends State<PersonDetailsCardWidget>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    swapAnimation = Tween(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        animationStatus = status;
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchData();
    });
  }

  GlobalKey containerKey = GlobalKey();

  double? animatedContainerHeight;

  late AnimationController animationController;

  late Animation swapAnimation;

  AnimationStatus animationStatus = AnimationStatus.dismissed;

  fetchData() {
    animatedContainerHeight = containerKey.currentContext?.size?.height;
  }

  void startAnimation() {
    if (animationStatus == AnimationStatus.dismissed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        startAnimation();
      },
      child: Transform(
        alignment: FractionalOffset.center,
        transform: Matrix4.identity()..rotateY(pi * swapAnimation.value),
        child: swapAnimation.value <= 0.5
            ? Container(
                key: containerKey,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greye1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ImageAvatar(
                            imagePath: widget.person.avatarPath,
                            size: 60,
                          ),
                          Icon(
                            Icons.qr_code,
                            size: 100,
                            color: AppColors.black,
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          widget.person.name,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ),
                      IconAndValueWidget(
                        icon: Icons.my_location_rounded,
                        value: widget.person.designation,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: IconAndValueWidget(
                          icon: Icons.phone_in_talk_outlined,
                          value: widget.person.phoneNumber,
                        ),
                      ),
                      IconAndValueWidget(
                        icon: Icons.mail,
                        value: widget.person.email,
                      ),
                    ],
                  ),
                ),
              )
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(pi),
                child: Container(
                  height: animatedContainerHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.greye1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 26, 16, 16),
                    child: Column(
                      children: [
                        IconAndValueWidget(
                          icon: Icons.home_work_outlined,
                          value: widget.person.companyName,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: IconAndValueWidget(
                            icon: Icons.location_on,
                            value: widget.person.address,
                          ),
                        ),
                        IconAndValueWidget(
                          icon: Icons.public_rounded,
                          value: widget.person.website,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
