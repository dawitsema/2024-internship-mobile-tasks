import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';

import 'view_all_products_test.mocks.dart';

void main() {
  late DeleteProduct usecase;
  late MockProductRepository mockProductRepository;

  setUp(() {
    mockProductRepository = MockProductRepository();
    usecase = DeleteProduct(mockProductRepository);
  });

  final tId = '1';

  test('should get a product Id and return the void', () async {
    //arrange
    when(mockProductRepository.deleteProduct(tId))
        .thenAnswer((_) async => Right(Void));
    //act
    final resutl = await usecase.execute(id: tId);
    //assert
    expect(resutl, Right(Void));
    verify(mockProductRepository.deleteProduct(tId));
    verifyNoMoreInteractions(mockProductRepository);
  });
}
