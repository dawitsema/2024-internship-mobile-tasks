import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_6/core/error/exceptions.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import '../../../../core/constants/constants.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getSpecificProduct(String id);
  Future<ProductModel> createNewProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;
  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final response = await client.get(Uri.parse(Urls.getAllProducts()));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return ProductModel.getAllProducts(decodedJson['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getSpecificProduct(String id) async {
    final response = await client.get(Uri.parse(Urls.getSpecificProduct(id)));
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return ProductModel.fromJson(decodedJson['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> createNewProduct(ProductModel product) async {
    final response = await client.post(
      Uri.parse(Urls.createProduct()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return ProductModel.fromJson(decodedJson['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await client.put(
      Uri.parse(Urls.updateProduct(product.id)),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'imageUrl': product.imageUrl,
      }),
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      return ProductModel.fromJson(decodedJson['data']);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse(Urls.deleteProduct(id)));
    if (response.statusCode != 200) {
      throw ServerException();
    }
  }
}
