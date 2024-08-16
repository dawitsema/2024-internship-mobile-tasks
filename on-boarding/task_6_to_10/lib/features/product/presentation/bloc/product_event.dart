part of 'product_bloc.dart';

abstract class ProductEvent {}

// Load all products
class LoadAllProductEvent extends ProductEvent {}

// Retrieve a single product by ID
class GetSpecificProductEvent extends ProductEvent {
  final String productId;
  GetSpecificProductEvent(this.productId);
}

// Update product details
class UpdateProductEvent extends ProductEvent {
  final ProductModel product;
  UpdateProductEvent(this.product);
}

// Delete a product
class DeleteProductEvent extends ProductEvent {
  final String productId;
  DeleteProductEvent(this.productId);
}

// Create a new product
class CreateProductEvent extends ProductEvent {
  final ProductModel product;
  CreateProductEvent(this.product);
}
