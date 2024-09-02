import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopping/model/cart_order_model.dart';
import 'package:shopping/model/product_model.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());
  ProductSize? size;
  int counter = 1;

  Future<void> getProductDetails(String productId) async {
    emit(ProductDetailsLoading());
    try {
      final product =
          dummyProduct.firstWhere((element) => element.id == productId);
      emit(ProductDetailsLoaded(product));
    } catch (e) {
      emit(ProductDetailsError(e.toString()));
    }
  }

  void incrementCounter() {
    counter++;
    emit(QuantityChanged(counter));
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
    }
    emit(QuantityChanged(counter));
  }

  void changeSize(ProductSize value) {
    size = value;
    emit(SizeChanged(size!));
  }

  Future<void> addToCart(ProductModel product) async {
    emit(AddingToCart());
    try {
      final cartOrder = CartOrdersModel(
        id: DateTime.now().toIso8601String(),
        product: product   ,
        totalPrice: counter * product.price,
        quantity: counter,
        size: size!,
      );
      dummyCartOrders.add(cartOrder);
      emit(AddedToCart());
    } catch (e) {
      emit(AddToCartError(e.toString()));
    }
  }
}
