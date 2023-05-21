import 'package:flutter/material.dart';
import 'package:mcontact/themes/colors.dart';
import 'package:mcontact/utils/utils.dart';

class AnimatedTextWidget extends StatefulWidget {
  final String text;
  final ScrollController scrollController;
  const AnimatedTextWidget(
      {super.key, required this.text, required this.scrollController});

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initScrollListner();
    });
  }

  double animatedPadding = 0;

  double leftPadding = 0;

  GlobalKey textKey = GlobalKey();

  void initScrollListner() {
    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels <= 100) {
        animatedPadding = 1 - widget.scrollController.position.pixels / 100;

        leftPadding = Utils.getScreenSize(context).width / 2 -
            (animatedPadding * Utils.getScreenSize(context).width / 2) -
            textKey.currentContext!.size!.width / 2 -
            20;
        if (leftPadding.isNegative) {
          leftPadding = 0.0;
        }
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Utils.getScreenSize(context).width - 20,
          height: 30,
          child: Stack(
            children: [
              Positioned(
                left: leftPadding,
                child: Text(
                  widget.text,
                  key: textKey,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
