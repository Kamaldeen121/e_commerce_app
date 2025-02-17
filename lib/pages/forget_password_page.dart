import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.grey.shade200,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              CustomText('Forget Password', Colors.black, 30, FontWeight.bold)
            ],
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 100),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              CustomTextfield(
                hintText: 'Email',
                labelText: 'email',
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                text: 'SEND',
                ontap: () {},
              ),
            ])));
  }
}
