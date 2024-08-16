import 'package:dartz/dartz.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, Product>> getSpecificProduct(String id);
  Future<Either<Failure, ProductModel>> createNewProduct(ProductModel product);
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product);
  Future<Either<Failure, void>> deleteProduct(String id);
}
