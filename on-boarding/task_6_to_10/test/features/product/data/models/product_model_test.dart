import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/product.dart';

import '../../helpers/dummy_data/json_reader.dart';

void main() {
  final tProductModel = ProductModel(
      id: "6672776eb905525c145fe0bb",
      name: "Anime website",
      description: "Explore anime characters.",
      price: 123,
      imageUrl:
          "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg");
  test('should be a sub class of product entity', () async {
    //assert
    expect(tProductModel, isA<Product>());
  });

  test('should return a valid model from json', () async {
    //arrange
    final Map<String, dynamic> jsonMap = json.decode(
      readJson('create_response.json'),
    );
    //act
    final result = ProductModel.fromJson(jsonMap);

    //assert
    expect(result, equals(tProductModel));
  });

  test("should return proper json map containing proper data", () async {
    //act
    final result = tProductModel.toJson();

    //assert
    final expectedJsonMap = {
      'id': '6672776eb905525c145fe0bb',
      'name': 'Anime website',
      'imageUrl':
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
      'price': 123,
      'description': 'Explore anime characters.'
    };

    expect(result, expectedJsonMap);
  });
}
