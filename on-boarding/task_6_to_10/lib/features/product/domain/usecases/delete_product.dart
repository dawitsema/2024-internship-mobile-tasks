import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/product_repository.dart';

class DeleteProduct {
  final ProductRepository productRepository;

  DeleteProduct(this.productRepository);

  Future<Either<Failure, void>> execute({required String id}) async {
    return await productRepository.deleteProduct(id);
  }
}
