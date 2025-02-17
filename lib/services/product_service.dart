import 'package:dio/dio.dart';
import 'package:ecommerce_app/api_client/api_client.dart';

class ProductService {
  final ApiClient apiClient;
  ProductService(this.apiClient);
  Future<Response> getProductData() async {
    final response = await apiClient.getData('/products');
    return response;
  }

  Future<Response> getCategoryData() async {
    final response = await apiClient.getData('/products/categories/');
    return response;
  }

  Future<Response> getJewelryData() async {
    final response = await apiClient.getData(
      '/products/category/jewelery',
    );
    return response;
  }

  Future<Response> getElectronicsData() async {
    final response = await apiClient.getData('/products/category/electronics');
    return response;
  }

  Future<Response> getMensData() async {
    final response =
        await apiClient.getData('/products/category/men\'s clothing');
    return response;
  }

  Future<Response> getWomensData() async {
    final response =
        await apiClient.getData('/products/category/Women\'s clothing');
    return response;
  }
}
