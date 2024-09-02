import 'package:bloc/bloc.dart';
import 'package:shopping/model/category_model.dart';
import 'package:shopping/model/product_model.dart';
import 'package:shopping/view_block/categor_cubit/category_cubit_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  // final List<CategoryModel> categories;
  // final List<ProductModel> products;

  // CategoryCubit({
  //   required this.categories,
  //   required this.products,
  // }) : super(CategoryInitial(
  //         categories: categories,
  //         products: products,
  //         filteredProducts: products,
  //       ));

  // void selectCategory(String? categoryId) {
  //   final filteredProducts = categoryId == null
  //       ? products
  //       : products
  //           .where((product) => product.category.id == categoryId)
  //           .toList();

  //   emit(CategoryUpdated(
  //     filteredProducts: filteredProducts,
  //     selectedCategoryId: categoryId,
  //   ));
  // }

  void getCategoryData() {
    emit(CategoryLoading());
    Future.delayed(Duration(seconds: 1), () {
      final products = dummyProduct;

      emit(CategoryLoaded());
    });
  }
}
