import 'package:flutter/material.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, floatingHintText;
  const PrimaryTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.floatingHintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: floatingHintText,
      ),
    );
  }
}
