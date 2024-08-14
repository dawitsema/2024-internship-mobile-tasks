import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetSpecificProduct {
  final ProductRepository productRepository;

  GetSpecificProduct(this.productRepository);

  Future<Either<Failure, Product>> call(String id) async {
    return await productRepository.getSpecificProduct(id);
  }
}
