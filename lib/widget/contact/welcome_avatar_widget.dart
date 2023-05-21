import 'package:flutter/material.dart';
import 'package:mcontact/resources/strings.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/widget/containers/containers.dart';

class WelcomeAvatar extends StatefulWidget {
  final String name, filePath;
  final ScrollController scrollController;
  const WelcomeAvatar({
    super.key,
    required this.name,
    required this.filePath,
    required this.scrollController,
  });

  @override
  State<WelcomeAvatar> createState() => _WelcomeAvatarState();
}

class _WelcomeAvatarState extends State<WelcomeAvatar> {
  double animatedOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initScrollListner();
    });
  }

  void initScrollListner() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels <= 100) {
        animatedOpacity = 1 - widget.scrollController.position.pixels / 100;

        if (animatedOpacity >= 1) {
          animatedOpacity = 1;
        }

        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animatedOpacity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Strings.welcome,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        color: AppColors.blue9b,
                      ),
                ),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 16,
                        color: AppColors.white,
                      ),
                ),
              ],
            ),
          ),
          WhiteBorderAvatar(
            imagePath: widget.filePath,
          )
        ],
      ),
    );
  }
}
