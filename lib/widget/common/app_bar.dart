import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(title),
    );
  }
}
