import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/features/product/data/datasources/product_local_data_source.dart';
import 'package:task_6/features/product/data/datasources/product_remote_data_source.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:task_6/core/network/network_info.dart';
import 'package:task_6/features/product/data/repositories/product_repository_impl.dart';
import 'package:task_6/features/product/domain/repositories/product_repository.dart';
import 'package:task_6/features/product/domain/usecases/create_new_product.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';
import 'package:task_6/features/product/domain/usecases/get_specific_product.dart';
import 'package:task_6/features/product/domain/usecases/update_product.dart';
import 'package:task_6/features/user/data/datasources/user_local_data_source.dart';
import 'package:task_6/features/user/domain/repositories/user_repository.dart';
import 'package:task_6/features/user/domain/usecases/get_user_usecase.dart';
import 'package:task_6/features/user/domain/usecases/login_usecase.dart';

import 'features/product/presentation/bloc/product_bloc.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repository/user_repository_impl.dart';
import 'features/user/domain/usecases/register_usecase.dart';
import 'features/user/presentation/bloc/user_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> setupLocator() async {
  // Shared Preferences instance
  final sharedPreferences = await SharedPreferences.getInstance();

  // Internet Connection Checker instance
  final internetConnectionChecker = InternetConnectionChecker();

  // Registering dependencies
  serviceLocator.registerLazySingleton<http.Client>(() => http.Client());
  serviceLocator
      .registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => internetConnectionChecker);

  // Network Info
  serviceLocator.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(serviceLocator<InternetConnectionChecker>()));

  // Local Data Source
  serviceLocator.registerLazySingleton<ProductLocalDataSource>(() =>
      ProductLocalDataSourceImpl(
          sharedPreferences: serviceLocator<SharedPreferences>()));

  // Remote Data Source
  serviceLocator.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: serviceLocator<http.Client>()));

  serviceLocator.registerLazySingleton<UserLocalDataSource>(() =>
      UserLocalDataSourceImpl(
          sharedPreferences: serviceLocator<SharedPreferences>()));

  serviceLocator.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(client: serviceLocator<http.Client>()));
  // Repository
  serviceLocator
      .registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
            localDataSource: serviceLocator<ProductLocalDataSource>(),
            remoteDataSource: serviceLocator<ProductRemoteDataSource>(),
            networkInfo: serviceLocator<NetworkInfo>(),
          ));

  serviceLocator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        localDataSource: serviceLocator<UserLocalDataSource>(),
        remoteDataSource: serviceLocator<UserRemoteDataSource>(),
        networkInfo: serviceLocator<NetworkInfo>(),
      ));

  // Use Cases
  serviceLocator.registerLazySingleton(
      () => CreateNewProduct(serviceLocator<ProductRepository>()));
  serviceLocator.registerLazySingleton(
      () => GetSpecificProduct(serviceLocator<ProductRepository>()));
  serviceLocator.registerLazySingleton(
      () => GetAllProducts(serviceLocator<ProductRepository>()));
  serviceLocator.registerLazySingleton(
      () => DeleteProduct(serviceLocator<ProductRepository>()));
  serviceLocator.registerLazySingleton(
      () => UpdateProduct(serviceLocator<ProductRepository>()));

  serviceLocator
      .registerLazySingleton(() => Login(serviceLocator<UserRepository>()));
  serviceLocator
      .registerLazySingleton(() => Register(serviceLocator<UserRepository>()));
  serviceLocator
      .registerLazySingleton(() => GetUser(serviceLocator<UserRepository>()));

  // Bloc
  serviceLocator.registerFactory<ProductBloc>(() => ProductBloc(
        createNewProduct: serviceLocator<CreateNewProduct>(),
        getSpecificProduct: serviceLocator<GetSpecificProduct>(),
        getAllProducts: serviceLocator<GetAllProducts>(),
        deleteProduct: serviceLocator<DeleteProduct>(),
        updateProduct: serviceLocator<UpdateProduct>(),
      ));

  serviceLocator.registerFactory<UserBloc>(() => UserBloc(
        login: serviceLocator<Login>(),
        register: serviceLocator<Register>(),
        getUser: serviceLocator<GetUser>(),
      ));
}
