import 'package:ecommerce_app/controller/signup_controller.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final Color? color = Colors.white;
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  final VoidCallback ontap;
  CustomButton(
      {super.key,
      required this.text,
      this.fontWeight,
      this.fontSize,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: color, fontWeight: fontWeight, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}
