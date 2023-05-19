import 'package:flutter/material.dart';
import 'package:mcontact/widget/common/app_bar.dart';

class BaseLayout extends StatefulWidget {
  final String? title;
  final Widget page;
  final bool showAppBar, showBottomNavBar;
  const BaseLayout({
    super.key,
    this.title,
    required this.page,
    required this.showAppBar,
    required this.showBottomNavBar,
  });

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: widget.showAppBar
            ? PreferredSize(
                preferredSize: const Size(double.infinity, 60),
                child: CommonAppBar(
                  title: widget.title.toString(),
                ),
              )
            : null,
        body: Stack(
          children: [
            widget.page,
            widget.showBottomNavBar
                ? Positioned(
                    child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        color: Colors.black,
                      )
                    ],
                  ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
