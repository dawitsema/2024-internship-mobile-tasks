import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:task_6/core/network/network_info.dart';
import 'package:task_6/features/product/data/datasources/product_local_data_source.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:task_6/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductRemoteDataSource,
    GetAllProducts,
    ProductLocalDataSource,
    NetworkInfo
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
