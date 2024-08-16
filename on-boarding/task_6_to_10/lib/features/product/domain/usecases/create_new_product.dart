import 'package:dartz/dartz.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateNewProduct {
  final ProductRepository productRepository;

  CreateNewProduct(this.productRepository);

  Future<Either<Failure, ProductModel>> call(ProductModel product) async {
    return await productRepository.createNewProduct(product);
  }
}
