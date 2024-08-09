import 'package:task_6/features/product/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> getSpecificProduct(String id);
  Future<ProductModel> createNewProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);

  void cacheProducts(List<ProductModel> result) {}
}
