import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/services/product_service.dart';
import 'package:flutter/material.dart';

class ProductController extends ChangeNotifier {
  ProductService productService;
  ProductController(this.productService);
  List<ProductModel> productList = [];
  List<dynamic> categoryList = [];
  List<CategoryModel> jewelryList = [];
  List<CategoryModel> electronicList = [];
  List<CategoryModel> mensClothingList = [];
  List<CategoryModel> womensClothingList = [];
  bool isloading = false;

  Future<void> getProductData() async {
    isloading = true;
    final response = await productService.getProductData();
    if (response.statusCode == 200) {
      final decodedData = response.data;

      final product = Products.fromJson(decodedData);

      productList.addAll(product.productList!);

      isloading = false;
      notifyListeners();
    } else {}
  }

  Future<void> getCategoryData() async {
    isloading = true;

    final response = await productService.getCategoryData();
    if (response.statusCode == 200) {
      final decodedData = response.data;
      final category = Categories.fromJson(decodedData);
      categoryList.addAll(category.categoryList!);
      isloading = false;
      notifyListeners();
    } else {}
  }

  Future<void> getJewelryData() async {
    isloading = true;

    final response = await productService.getJewelryData();
    if (response.statusCode == 200) {
      final decodedData = response.data;

      final jewelry = Jewelries.fromJson(decodedData);
      jewelryList.addAll(jewelry.jewelryList!);
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> getElectronicsData() async {
    isloading = true;

    final response = await productService.getElectronicsData();
    if (response.statusCode == 200) {
      final decodedData = response.data;

      final electronic = Electronics.fromJson(decodedData);
      electronicList.addAll(electronic.electronicList!);
      isloading = false;
    }
  }

  Future<void> getMensData() async {
    isloading = true;
    final response = await productService.getMensData();
    if (response.statusCode == 200) {
      final decodedData = response.data;

      final mensClothing = MensClothing.fromJson(decodedData);
      mensClothingList.addAll(mensClothing.mensClothingList!);
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> getWomensData() async {
    isloading = true;
    final response = await productService.getWomensData();
    if (response.statusCode == 200) {
      final decodedData = response.data;

      final womensClothing = MensClothing.fromJson(decodedData);
      womensClothingList.addAll(womensClothing.mensClothingList!);
      isloading = false;
      notifyListeners();
    }
  }
}
