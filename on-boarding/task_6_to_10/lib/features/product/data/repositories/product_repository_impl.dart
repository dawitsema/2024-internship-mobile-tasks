import 'package:dartz/dartz.dart';
import 'package:task_6/core/error/failures.dart';
import 'package:task_6/features/product/data/datasources/product_local_data_source.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';

import '../../../../core/network/network_info.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });
  @override
  Future<Either<Failure, Product>> getSpecificProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProduct = await remoteDataSource.getSpecificProduct(id);
        return Right(remoteProduct);
      } catch (e) {
        return Left(ServerFailure(e.toString()));
      }
    } else {
      try {
        final localProduct = await localDataSource.getSpecificProduct(id);
        return Right(localProduct);
      } catch (e) {
        return Left(CacheFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        return const Right(null);
      } on ServerFailure {
        return Left(ServerFailure("Server Failure"));
      }
    } else {
      return Left(ConnectionFailure('No internet connection'));
    }
  }

  // @override
  // Future<Either<Failure, List<Product>>> getAllProducts() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       final remoteProducts = await remoteDataSource.getAllProducts();
  //       localDataSource.cacheProducts(remoteProducts);
  //       return Right(remoteProducts);
  //     } catch (e) {
  //       return Left(ServerFailure(e.toString()));
  //     }
  //   } else {
  //     try {
  //       final localProducts = await localDataSource.getAllProducts();
  //       return Right(localProducts);
  //     } catch (e) {
  //       return Left(CacheFailure(e.toString()));
  //     }
  //   }
  // }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getAllProducts();
        localDataSource.cacheProducts(products);
        return Right(products);
      } on ServerFailure {
        return Left(ServerFailure("Server Failure"));
      }
    } else {
      try {
        final products = await localDataSource.getAllProducts();
        return Right(products);
      } on LocalDataSourceFailure {
        return Left(LocalDataSourceFailure('Failed to get products'));
      }
    }
  } // Ge

  @override
  Future<Either<Failure, ProductModel>> createNewProduct(
      ProductModel product) async {
    try {
      final results = await remoteDataSource.createNewProduct(product);
      return Right(results);
    } catch (e) {
      return Left(ServerFailure('Server: Failed to add product $e'));
    }
  }

  @override
  Future<Either<Failure, ProductModel>> updateProduct(ProductModel product) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
