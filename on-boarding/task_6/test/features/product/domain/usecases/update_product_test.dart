import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import 'package:task_6/features/product/domain/usecases/update_product.dart';

import 'view_all_products_test.mocks.dart';

void main() {
  late UpdateProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = UpdateProduct(mockProductRepository);
  });

  final Product1 = Product(
    id: '1',
    title: 'shoes',
    description: 'best product',
    category: 'brand',
    price: 23,
    rating: 5,
    imageUrl: 'imageUrl',
  );

  test('should get an existing product and return edited product', () async {
    //arrange
    when(mockProductRepository.updateProduct(Product1))
        .thenAnswer((_) async => Right(Product1));
    //act
    final resutl = await usecase.execute(product: Product1);
    //assert
    expect(resutl, Right(Product1));
    verify(mockProductRepository.updateProduct(Product1));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
