class WomensClothing {
  List<CategoryModel>? womensClothingList;
  WomensClothing({required this.womensClothingList});
  WomensClothing.fromJson(List<dynamic> list) {
    womensClothingList = [];
    for (var e in list) {
      womensClothingList?.add(CategoryModel.fromJson(e));
    }
  }
}

class MensClothing {
  List<CategoryModel>? mensClothingList;
  MensClothing({required this.mensClothingList});
  MensClothing.fromJson(List<dynamic> list) {
    mensClothingList = [];
    for (var e in list) {
      mensClothingList?.add(CategoryModel.fromJson(e));
    }
  }
}

class Electronics {
  List<CategoryModel>? electronicList;
  Electronics({required this.electronicList});
  Electronics.fromJson(List<dynamic> list) {
    electronicList = [];
    for (var e in list) {
      electronicList?.add(CategoryModel.fromJson(e));
    }
  }
}

class Jewelries {
  List<CategoryModel>? jewelryList;
  Jewelries({required this.jewelryList});
  Jewelries.fromJson(List<dynamic> list) {
    jewelryList = [];

    for (var e in list) {
      jewelryList?.add(CategoryModel.fromJson(e));
    }
  }
}

class CategoryModel {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  CategoryModel(
      {this.category,
      this.description,
      this.id,
      this.image,
      this.price,
      this.title});
  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
  }
}

class Categories {
  List<dynamic>? categoryList;

  Categories({
    this.categoryList,
  });

  Categories.fromJson(List<dynamic> list) {
    categoryList = [];

    for (var e in list) {
      categoryList!.add(e);
    }
  }
}

class Category {
  String? electronics;
  String? jewelery;
  String? mensClothing;
  String? womenClothing;
  Products? products;
  ProductModel? productModel;

  Category(
      {this.electronics,
      this.jewelery,
      this.productModel,
      this.mensClothing,
      this.womenClothing,
      this.products});

  Category.fromJson(Map<String, dynamic> json) {
    mensClothing = json["men's clothing"];
    electronics = json["electronics"];
    jewelery = json["jewelery"];
    womenClothing = json["women's clothing"];
    products = Products.fromJson(json['products'] as List);
    productModel = ProductModel.fromJson(json['productModel']);
  }
}

class Products {
  List<ProductModel>? productList;

  Products({
    this.productList,
  });

  Products.fromJson(List<dynamic> list) {
    productList = [];

    for (var e in list) {
      productList?.add(ProductModel.fromJson(e));
    }
  }
}

class ProductModel {
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  RatingModel? rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = RatingModel.fromJson(json['rating']);
  }
}

class RatingModel {
  dynamic rate;
  int? count;

  RatingModel({this.rate, this.count});

  RatingModel.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
