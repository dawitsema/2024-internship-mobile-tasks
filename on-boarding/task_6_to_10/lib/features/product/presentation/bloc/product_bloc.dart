import 'package:bloc/bloc.dart';
import 'package:task_6/features/product/domain/entities/product.dart';
import 'package:task_6/features/product/domain/usecases/create_new_product.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';
import 'package:task_6/features/product/domain/usecases/get_specific_product.dart';
import 'package:task_6/features/product/domain/usecases/update_product.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;
  final CreateNewProduct createNewProduct;
  final GetSpecificProduct getSpecificProduct;

  ProductBloc({
    required this.getAllProducts,
    required this.getSpecificProduct,
    required this.updateProduct,
    required this.deleteProduct,
    required this.createNewProduct,
  }) : super(InitialState()) {
    on<LoadAllProductEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrProducts = await getAllProducts();

      failureOrProducts.fold(
        (failure) {
          emit(ErrorState(failure.message));
        },
        (products) {
          emit(LoadedAllProductState(products));
        },
      );
    });

    // // Handle LoadAllProductEvent
    // on<LoadAllProductEvent>((event, emit) async {
    //   emit(LoadingState());
    //   final failureOrProducts = await getAllProducts();
    //   failureOrProducts.fold(
    //     (failure) => emit(ErrorState("Failed to load products")),
    //     (products) => emit(LoadedAllProductState(products)),
    //   );
    // });

    // on<LoadAllProductEvent>((event, emit) async {
    //   emit(LoadingState());
    //   final failureOrProducts = await getAllProducts();
    //   failureOrProducts.fold(
    //     (failure) => emit(ErrorState(failure.message)),
    //     (products) => emit(LoadedAllProductState(products)),
    //   );
    // });

    // Handle GetSingleProductEvent
    on<GetSpecificProductEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrProduct = await getSpecificProduct(event.productId);
      failureOrProduct.fold(
        (failure) => emit(ErrorState("Failed to load product")),
        (product) => emit(LoadedSingleProductState(product)),
      );
    });

    // Handle UpdateProductEvent
    on<UpdateProductEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrSuccess = await updateProduct(event.product);
      failureOrSuccess.fold(
        (failure) => emit(ErrorState("Failed to update product")),
        (_) => emit(UpdatedProductState(
            "Product updated Successfuly!")), // Or emit a specific success state
      );
    });

    // Handle DeleteProductEvent
    on<DeleteProductEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrSuccess = await deleteProduct(event.productId);
      failureOrSuccess.fold(
        (failure) => emit(ErrorState("Failed to delete product")),
        (_) => emit(DeletedProductState(
            "Product deleted Successfuly!")), // Or emit a specific success state
      );
    });

    // Handle CreateProductEvent
    on<CreateProductEvent>((event, emit) async {
      emit(LoadingState());
      final failureOrSuccess = await createNewProduct(event.product);
      print(failureOrSuccess);
      failureOrSuccess.fold(
        (failure) => emit(ErrorState("Failed to create product")),
        (_) => emit(AddedProductState(
            "Product added Successfuly")), // Or emit a specific success state
      );
    });
  }
}
