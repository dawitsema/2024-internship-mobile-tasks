import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/constants/constants.dart';
import 'package:task_6/core/error/exceptions.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:task_6/features/product/data/models/product_model.dart';

import '../../helpers/dummy_data/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
import 'dart:convert'; // Add this import

void main() {
  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get all the products data', () {
    test(
        'should return a list of products when the call to remote data source is successful(200)',
        () async {
      // arrange

      when(mockHttpClient.get(Uri.parse(Urls.getAllProducts())))
          .thenAnswer((_) async => http.Response(
                readJson('dummy_product_response.json'),
                200,
              ));
      //act
      final result = await productRemoteDataSourceImpl.getAllProducts();

      //assert
      expect(result, isA<List<ProductModel>>());
    });

    test(
        'should throw server exception when the response code is 404 or others',
        () async {
      // arrange

      when(mockHttpClient.get(Uri.parse(Urls.getAllProducts())))
          .thenAnswer((_) async => http.Response('Not found', 404));
      //act
      final result = productRemoteDataSourceImpl.getAllProducts();

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('get specific product by its id', () {
    test(
        'should return a product when the call to remote data source is successful(200)',
        () async {
      // arrange
      final id = '1';
      when(mockHttpClient.get(Uri.parse(Urls.getSpecificProduct(id))))
          .thenAnswer((_) async => http.Response(
                readJson('product_response.json'),
                200,
              ));
      //act
      final result = await productRemoteDataSourceImpl.getSpecificProduct(id);

      //assert
      expect(result, isA<ProductModel>());
    });

    test(
        'should throw server exception when the response code is 404 or others',
        () async {
      // arrange
      final id = '1';
      when(mockHttpClient.get(Uri.parse(Urls.getSpecificProduct(id))))
          .thenAnswer((_) async => http.Response('Not found', 404));
      //act
      final result = productRemoteDataSourceImpl.getSpecificProduct(id);

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });

  group('create product', () {
    final tProductModel = ProductModel(
      id: "6672752cbd218790438efdb0",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg",
    );

    test(
        'should return a ProductModel when the call to remote data source is successful (200)',
        () async {
      // arrange
      when(mockHttpClient.post(
        Uri.parse(Urls.createProduct()),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response(
            jsonEncode({
              "data": tProductModel.toJson(),
            }),
            200,
          ));

      // act
      final result =
          await productRemoteDataSourceImpl.createNewProduct(tProductModel);

      // assert
      expect(result, tProductModel);
    });

    test(
        'should throw server exception when the response code is 400 or others',
        () async {
      // arrange
      when(mockHttpClient.post(
        Uri.parse(Urls.createProduct()),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => http.Response('Bad request', 400));

      // act
      final call = productRemoteDataSourceImpl.createNewProduct(tProductModel);

      // assert
      expect(call, throwsA(isA<ServerException>()));
    });
  });
}
