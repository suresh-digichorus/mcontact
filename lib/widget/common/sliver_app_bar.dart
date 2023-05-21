import 'package:flutter/material.dart';
import 'package:mcontact/widget/contact/text_animation_widget.dart';
import 'package:mcontact/widget/contact/welcome_avatar_widget.dart';

class CommonSliverAppBar extends StatelessWidget {
  final String name;
  final String imagePath;
  final String title;
  const CommonSliverAppBar({
    super.key,
    required this.scrollController,
    required this.name,
    required this.imagePath,
    required this.title,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      centerTitle: true,
      expandedHeight: 150,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          WelcomeAvatar(
            name: name,
            filePath: imagePath,
            scrollController: scrollController,
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: AnimatedTextWidget(
            text: title,
            scrollController: scrollController,
          ),
        ),
      ),
    );
  }
}
