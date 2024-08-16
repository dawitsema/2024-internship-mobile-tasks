import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import 'package:task_6/features/product/domain/usecases/create_new_product.dart';

import 'view_all_products_test.mocks.dart';

void main() {
  late CreateNewProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = CreateNewProduct(mockProductRepository);
  });

  final Product1 = ProductModel(
    id: '1',
    name: 'shoes',
    description: 'best product',
    price: 23,
    imageUrl: 'imageUrl',
  );

  test('should get a product and return the product', () async {
    //arrange
    when(mockProductRepository.createNewProduct(Product1))
        .thenAnswer((_) async => Right(Product1));
    //act
    final resutl = await usecase(Product1);
    //assert
    expect(resutl, Right(Product1));
    verify(mockProductRepository.createNewProduct(Product1));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
