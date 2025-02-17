import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/services/user_services.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  UserServices userServices;

  SignupController({required this.userServices});
  List<SignupPayload> userList = [];
  bool isloading = false;
  String resposeMessage = '';
  SignupPayload? addedUser;

  Future<void> addNewUser(SignupPayload user) async {
    isloading = true;
    notifyListeners();

    final response = await userServices.addNewUser(user);
    if (response.statusCode == 200) {
      resposeMessage = 'User added successfully';
      print('.......${resposeMessage}');
      final decodedData = response.data;
      print('Response data: $decodedData');

      final newUser = SignupPayload(
        id: decodedData['id'],
        email: user.email,
        password: user.password,
        name: user.name,
      );
      print('New user: ${newUser.toJson()}');

      userList.add(newUser);
      addedUser = newUser;
      isloading = false;
      notifyListeners();
    } else {
      resposeMessage = 'User not added';
      print('not successful');
      isloading = false;
      notifyListeners();
    }
  }
}
