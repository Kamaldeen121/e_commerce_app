import 'package:dio/dio.dart';
import 'package:ecommerce_app/api_client/api_client.dart';
import 'package:ecommerce_app/model/user_model.dart';

class UserServices {
  ApiClient? apiClient;
  UserServices({this.apiClient});

  Future<Response> addNewUser(SignupPayload user) async {
    final response = await apiClient!.postData('/users', user.toJson());
    return response;
  }
}
