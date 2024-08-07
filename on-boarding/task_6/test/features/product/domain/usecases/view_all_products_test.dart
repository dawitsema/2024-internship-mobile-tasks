import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';

import 'view_all_products_test.mocks.dart';

@GenerateMocks([ProductRepository])
void main() {
  late GetAllProducts usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = GetAllProducts(mockProductRepository);
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

  var tProduct = [Product1, Product1];

  test('should return List of Product from ProductRepository', () async {
    //arrange
    when(mockProductRepository.getAllProducts())
        .thenAnswer((_) async => Right(tProduct));
    //act
    final resutl = await usecase.execute(any);
    //assert
    expect(resutl, Right(tProduct));
    verify(mockProductRepository.getAllProducts());
    verifyNoMoreInteractions(mockProductRepository);
  });
}
