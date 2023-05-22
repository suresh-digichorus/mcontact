import 'package:flutter/material.dart';
import 'package:mcontact/resources/strings.dart';

class PrimaryTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText, floatingHintText;
  final TextInputType? keyboardType;
  final Function? onChang;
  final FocusNode? focusNode;
  const PrimaryTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.floatingHintText,
    this.keyboardType,
    this.onChang,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      onChanged: (value) {
        if (onChang != null) {
          onChang!(value);
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: floatingHintText,
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function? onChang;

  const SearchBarWidget({
    super.key,
    required this.controller,
    this.focusNode,
    this.onChang,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      onChanged: (value) {
        if (onChang != null) onChang!(value);
      },
      decoration: const InputDecoration(
        hintText: Strings.search,
        prefixIcon: Icon(
          Icons.search,
          size: 30,
        ),
      ),
    );
  }
}
