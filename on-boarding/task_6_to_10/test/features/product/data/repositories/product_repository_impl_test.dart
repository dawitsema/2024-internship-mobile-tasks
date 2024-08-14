import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/error/exceptions.dart';
import 'package:task_6/core/error/failures.dart';
import 'package:task_6/core/network/network_info.dart';
import 'package:task_6/features/product/data/datasources/product_local_data_source.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import '../../helpers/test_helper.mocks.dart';

@GenerateMocks([ProductRemoteDataSource, ProductLocalDataSource, NetworkInfo])

// class MockProductRemoteDataSource extends Mock
//     implements ProductRemoteDataSource {}

// class MockProductLocalDataSource extends Mock
//     implements ProductLocalDataSource {}

// class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProductRepositoryImpl repository;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockProductRemoteDataSource,
      localDataSource: mockProductLocalDataSource,
      networkInfo: mockNetworkInfo,
    );

    // Stub the isConnected method
    when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
  });

  const tNumber = 1;
  final tProductModel = ProductModel(
    id: '234565432',
    name: 'shoes',
    description: 'best product',
    price: 23,
    imageUrl: 'imageUrl',
  );

  final tProduct = Product(
    id: '234565432',
    name: 'shoes',
    description: 'best product',
    price: 23,
    imageUrl: 'imageUrl',
  );

  String id = '234565432';

  group("get a specific product by providing Id", () {
    test('should return product when a call to data source is successful',
        () async {
      // Arrange
      when(mockProductRemoteDataSource.getSpecificProduct(id))
          .thenAnswer((_) async => tProductModel);

      // Act
      final result = await repository.getSpecificProduct(id);

      // Assert
      expect(result, equals(Right(tProductModel)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      // Arrange
      when(mockProductRemoteDataSource.getSpecificProduct(id))
          .thenThrow(ServerException());

      // Act
      final result = await repository.getSpecificProduct(id);

      // Assert
      expect(
          result, equals(const Left(ServerFailure('An error has occurred'))));
    });

    test(
        'should return connection failure when there is no internet connection',
        () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // Act
      final result = await repository.getSpecificProduct(id);

      // Assert
      expect(
          result,
          equals(const Left(
              ConnectionFailure('Failed to connect to the internet'))));
    });
  });
}
