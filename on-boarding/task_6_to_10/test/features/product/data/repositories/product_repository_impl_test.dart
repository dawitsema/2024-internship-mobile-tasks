import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/platform/network_info.dart';
import 'package:task_6/features/product/data/datasources/product_local_data_source.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_6/features/product/domain/entities/product.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class MockProductLocalDataSource extends Mock
    implements ProductLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

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
  });
  final tNumber = 1;
  final tProductModel = ProductModel(
    id: tNumber.toString(),
    name: 'shoes',
    description: 'best product',
    price: 23,
    imageUrl: 'imageUrl',
  );

  final Product tProdut = tProductModel;

  final List<ProductModel> tProductModelList = [tProductModel];
  final List<Product> tProducList = tProductModelList;

  group("description", () async {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      repository.getAllProducts();
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group("device is online", () async {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test(
          "should return remote data when the call to remote data is successful",
          () async {
        //arrange
        when(mockProductRemoteDataSource.getAllProducts())
            .thenAnswer((_) async => tProductModelList);
        //act
        final result = await repository.getAllProducts();
        //assert
        verify(mockProductRemoteDataSource.getAllProducts());
        expect(result, equals(tProducList));
      });

      test(
          "should cache data locally when the call to remote data is successful",
          () async {
        //arrange
        when(mockProductRemoteDataSource.getAllProducts())
            .thenAnswer((_) async => tProductModelList);
        //act
        final result = await repository.getAllProducts();
        //assert
        verify(mockProductRemoteDataSource.getAllProducts());
        verify(mockProductLocalDataSource.cacheProducts(tProductModelList));
      });
    });
  });

  group("device is offline", () async {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
  });
}
