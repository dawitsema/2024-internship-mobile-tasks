part of 'product_bloc.dart';

abstract class ProductState {}

// Initial state before data is loaded
class InitialState extends ProductState {}

// Indicates that the app is currently fetching data
class LoadingState extends ProductState {}

// State when all products are successfully loaded
class LoadedAllProductState extends ProductState {
  final List<Product> products;
  LoadedAllProductState(this.products);
}

// State when a single product is successfully retrieved
class LoadedSingleProductState extends ProductState {
  final Product product;
  LoadedSingleProductState(this.product);
}

// Indicates that an error occurred during data retrieval or processing
class ErrorState extends ProductState {
  final String message;
  ErrorState(this.message);
}

class AddedProductState extends ProductState {
  final String message;
  AddedProductState(this.message);
}
