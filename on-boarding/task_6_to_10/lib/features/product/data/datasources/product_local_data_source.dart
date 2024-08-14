import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/core/error/exceptions.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getSpecificProduct(String id);
  Future<ProductModel> createNewProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  void cacheProducts(List<ProductModel> result);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  final String cachedProductsKey = 'CACHED_PRODUCTS';

  ProductLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final jsonString = sharedPreferences.getString(cachedProductsKey);
    if (jsonString != null) {
      final List<dynamic> decodedJson = json.decode(jsonString);
      return decodedJson
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw CacheException();
    }
  }

  @override
  Future<ProductModel> getSpecificProduct(String id) async {
    final products = await getAllProducts();
    final product = products.firstWhere((product) => product.id == id,
        orElse: () => throw CacheException());
    return product;
  }

  @override
  Future<ProductModel> createNewProduct(ProductModel product) async {
    final products = await getAllProducts();
    products.add(product);
    await _saveToCache(products);
    return product;
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final products = await getAllProducts();
    final index = products.indexWhere((p) => p.id == product.id);
    if (index == -1) throw CacheException();
    products[index] = product;
    await _saveToCache(products);
    return product;
  }

  @override
  Future<void> deleteProduct(String id) async {
    final products = await getAllProducts();
    final updatedProducts =
        products.where((product) => product.id != id).toList();
    if (updatedProducts.length == products.length) throw CacheException();
    await _saveToCache(updatedProducts);
  }

  @override
  void cacheProducts(List<ProductModel> result) {
    _saveToCache(result);
  }

  Future<void> _saveToCache(List<ProductModel> products) async {
    final jsonString =
        json.encode(products.map((product) => product.toJson()).toList());
    await sharedPreferences.setString(cachedProductsKey, jsonString);
  }
}
