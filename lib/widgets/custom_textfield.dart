import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final int? maxLines;
  final int? minLines;
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  const CustomTextfield(
      {super.key,
      this.maxLines,
      this.minLines,
      required this.controller,
      required this.hintText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      minLines: minLines,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
