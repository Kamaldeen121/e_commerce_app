import 'dart:io';

import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://fakestoreapi.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 60)));

  ApiClient() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      options.headers['Accept'] = 'application/json';
      options.headers['Authorization'] = '';
      return handler.next(options);
    }));
  }

  Future<Response> getData(String endpoint) async {
    try {
      Response response = await dio.get(endpoint);
      return response;
    } on DioException {
      rethrow;
    } on SocketException {
      rethrow;
    }
  }

  Future<Response> postData(
      String endpoint, Map<String, dynamic> payload) async {
    try {
      Response response = await dio.post(endpoint, data: payload);
      return response;
    } on DioException {
      rethrow;
    } on SocketException {
      rethrow;
    }
  }
}
