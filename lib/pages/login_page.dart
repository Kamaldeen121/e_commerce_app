import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/pages/bottom_navbar_page.dart';
import 'package:ecommerce_app/pages/home_page.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final SignupPayload? user;

  const LoginPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextfield(
              hintText: 'Email',
              labelText: 'email',
              controller: emailController,
            ),
            SizedBox(height: 20),
            CustomTextfield(
              hintText: 'Password',
              labelText: 'password',
              controller: passwordController,
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Login',
              ontap: () {
                if (emailController.text == user?.email &&
                    passwordController.text == user?.password) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbarPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Invalid credentials'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
