import 'package:task_6/features/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required String id,
    required String name,
    required String description,
    required int price,
    required String imageUrl,
  }) : super(
          description: description,
          id: id,
          imageUrl: imageUrl,
          price: price,
          name: name,
        );

  static List<ProductModel> getAllProducts(List<dynamic> jsons) {
    List<ProductModel> products = [];
    for (dynamic product in jsons) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '', // Default to an empty string if null
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0, // Default to 0 if null
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'price': price,
        'description': description,
      };

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
    );
  }
}
