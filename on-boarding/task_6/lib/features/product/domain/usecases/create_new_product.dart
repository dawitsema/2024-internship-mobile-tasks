import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class CreateNewProduct {
  final ProductRepository productRepository;

  CreateNewProduct(this.productRepository);

  Future<Either<Failure, Product>> execute({required Product product}) async {
    return await productRepository.createNewProduct(product);
  }
}
