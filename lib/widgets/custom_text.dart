import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomText(
    this.text,
    this.color,
    this.fontSize,
    this.fontWeight, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: 2,
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
          overflow: TextOverflow.clip),
    );
  }
}
