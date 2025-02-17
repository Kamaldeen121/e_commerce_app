import 'package:ecommerce_app/api_client/api_client.dart';
import 'package:ecommerce_app/controller/product_controller.dart';
import 'package:ecommerce_app/controller/signup_controller.dart';
import 'package:ecommerce_app/pages/signup_page.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:ecommerce_app/services/user_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ProductController(ProductService(ApiClient()))),
      ChangeNotifierProvider(
          create: (_) => SignupController(
              userServices: UserServices(apiClient: ApiClient())))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SignupPage(),
    );
  }
}
