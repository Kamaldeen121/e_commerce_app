import 'package:ecommerce_app/controller/signup_controller.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/pages/login_page.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:ecommerce_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade200,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back_ios,
              size: 25,
            ),
            SizedBox(
              height: 30,
            ),
            CustomText('Sign up', Colors.black, 30, FontWeight.bold)
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 100),
        decoration: BoxDecoration(color: Colors.grey.shade200),
        child: Column(
          children: [
            CustomTextfield(
              hintText: 'Name',
              labelText: 'name',
              controller: nameController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextfield(
              hintText: 'Email',
              labelText: 'email',
              controller: emailController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextfield(
              hintText: 'Password',
              labelText: 'password',
              controller: passwordController,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText('Already have an account?', Colors.black, 15,
                    FontWeight.bold),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<SignupController>(
                builder: (BuildContext context, controller, child) {
              return controller.isloading == true
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : CustomButton(
                      text: 'Sign up',
                      ontap: () async {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            nameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          final newUser = SignupPayload(
                            name: Name(
                              firstname: nameController.text.trim(),
                              lastname: nameController.text.trim(),
                            ),
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                          print('New user before sending: ${newUser.toJson()}');
                          await controller.addNewUser(newUser);
                          await Future.delayed(Duration(seconds: 2));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('User added successfully'),
                              backgroundColor: Colors.red,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(
                                user: controller.addedUser,
                              ),
                            ),
                          );
                        }
                      },
                    );
            }),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 6,
            ),
            CustomText('Or Sign up with social account', Colors.black, 15,
                FontWeight.bold),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    'images/google-removebg-preview.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset(
                    'images/facebook.png',
                    height: 30,
                    width: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
